from swiplserver import PrologThread


class friend_search:
    def __init__(self, name: str = ''):
        self.name = name

    def execute(self, prolog: PrologThread):
        res = prolog.query(self.query())
        if not res or len(res[0]["Friends"]) == 0:
            self.failure(res)
        else:
            self.success(res)

    def query(self):
        return f"printFriends('{self.name}', Friends)"

    def init_values(self, match):
        if (len(match) > 1):
            print("Неверный ввод")
        else:
            self.name = match[0]

    def failure(self, res):
        print(f'{self.name} не имеет друзей :(')

    def success(self, res):
        print(f'У {self.name} есть {len(res[0]["Friends"])} друзей, а именно - ', end="")
        for i in range(len(res[0]["Friends"])):
            if (i != len(res[0]["Friends"]) - 1):
                print(res[0]["Friends"][i], end=", ")
            else:
                print(res[0]["Friends"][i], end=".")
        print("\n")