#!/bin/sh
cd ~/repos

git clone https://hblitza@bitbucket.org/geowerkstatt-hamburg/masterportal.git masterportal
cd masterportal
git remote add geowerkstatt https://bitbucket.org/geowerkstatt-hamburg/masterportal.git
git checkout devtools/webpack.dev.js
git fetch --all --tags
git checkout $MASTERPORTAL_VERSION

# disable host check in webpack in order to get apache proxy working together with webpack
sed -i 's;port: 9001,;port: 9001,disableHostCheck: true,;' devtools/webpack.dev.js
# disable https to get hot reload running again
sed -i 's;https: true,;https: false,;' devtools/webpack.dev.js

npm i
npm run start -- --host 0.0.0.0
