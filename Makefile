ROOT_DIR    =`pwd`
REPORT_DIR  = $(shell pwd)/reports

all: doctrine-dbal

report_dir:
	@mkdir -p $(REPORT_DIR)

doctrine-dbal: doctrine-dbal-mysql doctrine-dbal-pgsql doctrine-dbal-sqlite

doctrine-dbal-mysql: report_dir
	@echo "Executing $@"
	@./bin/run_jackalope_doctrine_dbal.sh mysql $(REPORT_DIR)

doctrine-dbal-pgsql: report_dir
	@echo "Executing $@"
	@./bin/run_jackalope_doctrine_dbal.sh pgsql $(REPORT_DIR)

doctrine-dbal-sqlite: report_dir
	@echo "Executing $@"
	@./bin/run_jackalope_doctrine_dbal.sh sqlite $(REPORT_DIR)

clean:
	rm -Rf $(REPORT_DIR)
