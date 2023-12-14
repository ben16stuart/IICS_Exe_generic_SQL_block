#######################################################################################################################################################################
# File Name:    frl_execute_sql_block.sh                                                                  #
# Purpose:      This script is to run a generic sql query populated from input arguments                  #

# Functionality: This script is created to hopefully run BQ sql queries specified by the user (also to run multi part scripts that IICS cant handle natively)         #
# Called From:  Informatica Workflows.
# Syntax:   sh /opt/idw/pr/common/cmd/frl_execute_sql_block.sh <QUERY> <project_id> <schema?> <table?> ......<other arguments> #
 
# Notes:    The first query arg should use <<1>>, <<2>>...... for replacing variables.  If you pass "Select * From <<1>>", "table" it will return "Select * from table"
    # If you pass "Select * From <<1>>.<<2>> where <<3>> = <<4>>", "table", "something", "foo", "bar" it will return Select * from table.something where foo=bar
    # The arguments number is not limited. The max length of the query is 8,000ish characters I believe
 
    # The first argument needs to be the query
    # The second argument needs to be the project_id
    # Everything else is up to you
 
    #Still a work in progress for complex multiline queries with special characters
