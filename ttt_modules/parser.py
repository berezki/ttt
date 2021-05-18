from openpyxl import load_workbook
from sqlite3 import connect
from datetime import datetime


def load_from_xlsx_to_db(group):

    conn = connect('data/timetable.db')
    xlsx_file_path = f'data/{group}.xlsx'

    cursor = conn.cursor()
    wb = load_workbook(xlsx_file_path)
    
    odd_and_even_ids = []

    for sheet in range(0,2):
        week_ids = []
        wb.active = sheet
        
        time_st = [
            '08:00-09:35',
            '09:45-11:20',
            '11:50-13:25',
            '13:35-15:10',
            '15:40-16:55',
            '17:25-19:00',
            '19:05-20:40',
            '20:45-22:20'
        ]

        for column in 'bcdefg':
            schedule = {}
            for row in range(2,8):
                schedule[time_st[row-2]] = wb.active[f'{column}{row}'].value
            if schedule != {}:
                cursor.execute(f"INSERT INTO day VALUES (?)", schedule)
                week_ids.append(cursor.lastrowid)
            else:
                week_ids.append(None)

        cursor.execute(f"INSERT INTO week VALUES (?, ?, ?, ?, ?, ?)", week_ids)
        odd_and_even_ids.append(cursor.lastrowid)
        
    cursor.execute(f"INSERT INTO time_table VALUES (?, ?)", odd_and_even_ids)
    conn.commit()
    return cursor.lastrowid

def week_is_even():
    return True if datetime.now().isocalendar()[1]%2 == 0 else False


