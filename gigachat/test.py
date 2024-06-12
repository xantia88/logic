import requests
import uuid
import json
import urllib.parse

def getToken(auth_data):
    
    payload='scope=GIGACHAT_API_PERS'
    headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        'RqUID': str(uuid.uuid4()),
        'Authorization': 'Basic {}'.format(auth_data)
    }

    url = "https://ngw.devices.sberbank.ru:9443/api/v2/oauth"
    response = requests.request("POST", url, headers=headers, data=payload)
    data = json.loads(response.text)
    
    return data["access_token"]

def getResponse(auth_data, text, question):
   
    token = getToken(auth_data)

    payload = json.dumps({
        "model": "GigaChat",
        "messages": [
            {
                "role": "user",
                "content": "{}{}".format(text, question) 
            }
        ],
        "temperature": 1,
        "top_p": 0.1,
        "n": 1,
        "stream": False,
        "max_tokens": 1024,
        "repetition_penalty": 1
    })
    
    headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer {}'.format(token)
    }

    url = "https://gigachat.devices.sberbank.ru/api/v1/chat/completions"
    response = requests.request("POST", url, headers=headers, data=payload)
    
    return response.text

auth_data = "ODYyOWE4MWUtZDU2NS00MzI1LWE0MzItNzZmNDNmYjBiYTczOjQ4ZTFjMGZhLTM5ZDgtNDk4Mi1iMjVjLWU2NjgyMzBmMzgyOQ=="

language = None
with open("language.txt") as file:
    language = file.read()

questions = [
    "Задача 123 в находится статусе запланировано, и еще она реализует стратегию 567, и еще она имеет описание 567. как это написать на языке ДКА ?",
    "как описать на языке дка, что задача имеет дедлайн 123",
    "опиши на языке ДКА задачу с кодом 5",
    "задача с кодом 1 отменена, она имеет описание 5, срок ее реализации 123, она связана со стратегией XXX. ответь на язык ДКА",
    "перепиши текст на языке ДКА: задача с кодом 1 отменена, она имеет описание 5, срок ее реализации 123, она связана со стратегией XXX. ",
    "task(123). description(task(123), 'тут описание'). deadline(task(123), '22.01.2024'). realize(task(123), strategy(567)). это код на языке ДКА, переведи его на русский и исключи из ответа сам код",
    "задача с кодом 1 отменена, она имеет описание 5, срок ее реализации 123, она связана со стратегией XXX. какая информация в этом тексте относится к стратегии на языке ДКА ?",
    "task(123). description(task(123), 'тут описание'). deadline(task(123), '22.01.2024'). realize(task(123), strategy(567)). какая информация в этом тексте относится к стратегии на языке ДКА ?",
    "текст на языке ДКА c полным описанием задачи: status(task(1), xxx). задача описана полностью ? покажи все ошибки"
    ]

for question in questions:
    print("---------------------")
    print("[ Request  > ]", question)
    print("---------------------")
    response = getResponse(auth_data, language, question)
    response = json.loads(response)
    response = response["choices"][0]["message"]["content"]
    print("[ GigaChat < ]", response)
    print("")

