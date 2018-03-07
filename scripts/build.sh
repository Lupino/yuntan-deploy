#!/usr/bin/env bash

PACKAGES=(
    https://github.com/Lupino/yuntan-base.git
    https://github.com/Lupino/yuntan-common.git
    https://github.com/Lupino/haskell-periodic.git
)

APPS=(
    https://github.com/Lupino/coin.git
    https://github.com/Lupino/yuntan-article.git
    https://github.com/Lupino/yuntan-share.git
    https://github.com/Lupino/yuntan-user.git
    https://github.com/Lupino/func.git
    https://github.com/Lupino/sharefs.git
    https://github.com/Lupino/yuntan-cart.git
    https://github.com/Lupino/mergeJsonRequest.git
    https://github.com/Lupino/yuntan-mqtt.git
)

SYSTEM_APPS=(
    http://github.com/Lupino/yuntan-gateway.git
)

TOOLS=(
)

THIRD_PARTY=(
    https://github.com/MichaelXavier/Angel.git
    https://github.com/jdnavarro/graphql-haskell.git
    https://github.com/lpeterse/haskell-hummingbird.git
    https://github.com/lpeterse/haskell-mqtt.git
    https://github.com/facebook/Haxl.git
    https://github.com/lpeterse/haskell-networking.git
)

update_package() {
    pkg=$1
    base_package_name=`basename ${pkg%.git}`
    if [ -d $base_package_name ];then
        cd $base_package_name
        git reset --hard
        git clean -f
        git pull
        cd ..
    else
        git clone $pkg
    fi
}

mkdir -p packages
cd packages
for pkg in ${PACKAGES[@]};do
    update_package $pkg
done
cd ..

mkdir -p apps
cd apps
for pkg in ${APPS[@]};do
    update_package $pkg
done
cd ..

mkdir -p system
cd system
for pkg in ${SYSTEM_APPS[@]};do
    update_package $pkg
done
cd ..

mkdir -p tools
cd tools
for pkg in ${TOOLS[@]};do
    update_package $pkg
done
cd ..

mkdir -p third_party
cd third_party
for pkg in ${THIRD_PARTY[@]};do
    update_package $pkg
done
cd ..

sed '/Aeson$/s/$/                         hiding (Options)/' -i third_party/haskell-hummingbird/src/Hummingbird.hs
sed '/hummingbird.hs$/s/hummingbird/Main/' -i third_party/haskell-hummingbird/hummingbird.cabal

cd third_party/haskell-hummingbird/app
mv hummingbird.hs Main.hs
cd -

stack build

stack install
