import re
from swiplserver import PrologMQI, create_posix_path
import friend_search, liberal_search, work_search, fear_search

PATH = r'C:\Users\artem\Documents\AI_systems\lab3\disco.pro'

queries = [
    "\n Whom afraids of everart?",
    "Is joice a liberal?",
    "Show all jobs of garrie",
    "Show all friends of garrie"

]

patterns = {
    r'Whom afraids of (.+)\?' : fear_search.fear_search(),
    r'Is (.+) a liberal\?' : liberal_search.liberal_search(),
    r'Show all jobs of (.+)' : work_search.work_search(),
    r'Show all friends of (.+)' : friend_search.friend_search()
}

with PrologMQI() as mqi:
    with mqi.create_thread() as prolog:
        path = create_posix_path(PATH)
        prolog.query(f'consult("disco.pro")')
        while True:
            query = input('$ ')
            if query.lower() == 'stop':
                break
            for pattern in patterns:
                match = re.match(pattern, query, re.IGNORECASE)
                if match is None:
                    continue
                task = patterns[pattern]
                task.init_values(match.groups())
                task.execute(prolog)
                break
            else:
                print("Wrong input")