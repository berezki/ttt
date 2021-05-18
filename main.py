from ttt_modules import parser
from sqlite3 import connect
from sqlite3 import OperationalError

r'^\d-{А-ЯЁ}{1,6}-\d$'


def executeScriptsFromFile(filename):
    conn = connect('data/timetable.db')
    cursor = conn.cursor()
    # Open and read the file as a single buffer
    fd = open(filename, 'r')
    sqlFile = fd.read()
    fd.close()

    # all SQL commands (split on ';')
    sqlCommands = sqlFile.split(';')

    # Execute every command from the input file
    for command in sqlCommands:
        # This will skip and report errors
        # For example, if the tables do not yet exist, this will skip over
        # the DROP TABLE commands
        try:
            cursor.execute(command)
        except OperationalError:
            pass


def main():
    executeScriptsFromFile('ttt_modules/createtable.sql')


if __name__ == '__main__':
    main()
