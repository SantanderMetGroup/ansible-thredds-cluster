#!/usr/bin/python
import yaml
import sys
import paramiko

def update_proxy(proxyName, options):
  
  paramiko.util.log_to_file('paramiko.log')
  try:
    ssh = paramiko.SSHClient()
    ssh.load_system_host_keys()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname = proxyName, username='root')
    try:
      stdin,stdout,stderr = ssh.exec_command(command="%s" %options)
      
      outlines=stdout.readlines() 
      resp=''.join(outlines) 
      print(resp)

    except paramiko.SSHException:
      print ("SSH Exception failed when executing the command in %s" %proxyName)
      sys.exit(1)
  except paramiko.AuthenticationException:
    print ("Authentication failed when connecting to %s" %proxyName)
    sys.exit(1)
  except paramiko.SSHException:
    print ("SSH Exception failed when connecting to %s" %proxyName)
    sys.exit(1)
  except paramiko.BadHostKeyException:
    print ("BadHost Key Exception failed when connecting to %s" %proxyName)
    sys.exit(1)
 

def get_content():

  with open("tomcat_instances.yaml", 'r') as info:
    try:
        info_dict = yaml.load(info)
        for instance in info_dict:
          
          tomcat_instance = instance
          workerName = (" --workerName " + tomcat_instance["name"] + " ")
          workerPort = ("--workerPort " + str(tomcat_instance["ajp"]["port"]) + " ")
          proxyName = tomcat_instance["ajp"]["proxyName"]
          
          if "ip_internal_address" in tomcat_instance:
            workerHost = ("--workerHost " + tomcat_instance["ip_internal_address"] + " ")
            ip_address = tomcat_instance["ip_internal_address"]
          elif "ip_address" in tomcat_instance:
            workerHost = ("--workerHost " + tomcat_instance["ip_address"] + " ") 
            ip_address = tomcat_instance["ip_address"]
    
          for gws in instance["gws_instance"]:
            gwsName = ("--gwsName " + gws["name"])

            action = raw_input("Action for %s tomcat instance(%s:%i) with gwsName %s : " %(tomcat_instance["name"],ip_address,tomcat_instance["ajp"]["port"],gws["name"]))

            if action == "addWorker":
              options = action + workerName + workerPort + workerHost + gwsName
            elif action == "removeWorker":
              options = action + workerName + gwsName
            else:
              break
            update_proxy(proxyName,options)
                         
    except yaml.YAMLError as exc:
        print(exc)
  
def main():
  print "Help:"
  print "Action = addWorker | removeWorker (by default: Nothing to do) \n"
  get_content()
      
if __name__ == "__main__":
  main()


