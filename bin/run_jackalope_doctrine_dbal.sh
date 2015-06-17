#!/bin/bash
ROOT_DIR=`pwd`

DB=$1
REPORT_DIR=$2

cd vendor/jackalope/jackalope-doctrine-dbal

if [ -h ./vendor ]; then
    rm vendor -f
fi

ln -s $ROOT_DIR/vendor vendor
php tests/generate_phpunit_config.php $DB
cp $DB.phpunit.xml phpunit.xml
php vendor/bin/phpbench run --config=vendor/phpcr/phpcr-benchmarks/config/phpbench --dump > $REPORT_DIR/jackalope-doctrine-dbal-$DB.xml
