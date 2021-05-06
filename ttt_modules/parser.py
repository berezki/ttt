from openpyxl import load_workbook
from sqlite3 import connect
from datetime import datetime


def load_from_xlsx_to_db(group):

    conn = connect('data/timetable.db')
    xlsx_file_path = f'data/{group}.xlsx'

    cursor = conn.cursor()
    wb = load_workbook(xlsx_file_path)
    
    for sheet in range(0,2):

        cursor.execute(f"CREATE TABLE IF NOT EXISTS table_{group}_{sheet} ('1' text, '2' text, '3' text, '4' text, '5' text, '6' text)")
        wb.active = sheet

        for column in 'bcdefg':
            cort = list()
            for row in range(2,8):
                cort.append(wb.active[f'{column}{row}'].value)
            
            cursor.execute(f'INSERT INTO table_{group}_{sheet} VALUES (?,?,?,?,?,?)', cort)
    conn.commit()

def week_is_even():
    return True if datetime.now().isocalendar()[1]%2 == 0 else False


