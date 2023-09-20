from swiplserver import PrologThread

class work_search:
    def __init__(self, name: str = ''):
        self.name = name

    def execute(self, prolog: PrologThread):
        result = prolog.query(self.query())
        if not result or len(result[0]["works_for"]) == 0:
            self.failure(result)
        else:
            self.success(result)

    def query(self):
        return f"workSearch('{self.name}', work)"

    def init_values(self, match):
        if (len(match) > 1):
            print("Неверный ввод")
        else:
            self.name = match[0]

    def failure(self, result):
        print(f'{self.name} no work🤨?')

    def success(self, result):
        print(f'{self.name} has {len(result[0]["works_for"])} works: ', end="")
        for i in range(len(result[0]["works_for"])):
            if (i != len(result[0]["works_for"]) - 1):
                print(result[0]["works_for"][i], end=", ")
            else:
                print(result[0]["works_for"][i], end=".")
        print("\n")