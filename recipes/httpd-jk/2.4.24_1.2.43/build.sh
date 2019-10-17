ROOT=${PREFIX}/opt/httpd

export LD_LIBRARY_PATH=${PREFIX}/opt/httpd/lib:$LD_LIBRARY_PATH

# Build APR
pushd apr || return 1;
./configure --prefix $ROOT
make
make install
popd || return 1;

# Build APR-Util
pushd apr-util || return 1;
./configure --prefix $ROOT --with-apr=../apr
make
make install
popd || return 1;

# Build PCRE
pushd pcre || return 1;
./configure --prefix $ROOT --with-prefix=$ROOT
make
make install
popd || return 1;

# Build httpd
pushd httpd || return 1;
./configure --prefix $ROOT --enable-mpms-shared=all --with-apr=../apr --with-apr-util=../apr-util --with-pcre=$ROOT/bin/pcre-config
make
make install
popd || return 1;

# Build mod_jk
pushd mod-jk/native || return 1;
./configure --with-apxs=$ROOT/bin/apxs
make
make install
popd || return 1;

# Other required actions
mkdir -vp $ROOT/logs
touch $ROOT/logs/error_log

cp -v conf/httpd.conf $ROOT/conf/httpd.conf

pushd ${PREFIX}/bin || return 1;
ln -vs $ROOT/bin/httpd . || return 1;
ln -vs $ROOT/bin/apachectl . || return 1;
popd || return 1;
