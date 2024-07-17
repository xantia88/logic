import requests
import uuid
import json
import urllib.parse
import configparser

# ----------------------------------------------
def getToken(config):
    
    payload='scope=GIGACHAT_API_PERS'
    headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        'RqUID': str(uuid.uuid4()),
        'Authorization': 'Basic {}'.format(config["auth_data"])
    }

    response = requests.request("POST", config["auth_url"], headers=headers, data=payload)
    data = json.loads(response.text)
    
    return data["access_token"]
# ----------------------------------------------
def getResponse(config, language, question):
   
    token = getToken(config)

    payload = json.dumps({
        "model": "GigaChat",
        "messages": [
            {
                "role": "user",
                "content": "{}{}".format(language, question) 
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

    response = requests.request("POST", config["request_url"], headers=headers, data=payload)
    
    return response.text
# ----------------------------------------------
def getLanguage(config):
    language = None
    with open(config["language"]) as file:
        language = file.read()
    return language
# ----------------------------------------------

config = configparser.ConfigParser()
config.read("config.ini")
gcConfig = config["GIGACHAT"]
language = getLanguage(gcConfig)
"""
questions = [
    "Задача 123 в находится статусе запланировано, и еще она реализует стратегию 567, и еще она имеет описание 567. как это написать на языке ДКА ?",
    "как описать на языке дка, что задача имеет дедлайн 123",
    "опиши на языке ДКА задачу с кодом 5",
    "задача с кодом 1 отменена, она имеет описание 5, срок ее реализации 123, она связана со стратегией XXX. ответь на язык ДКА",
    "перепиши текст на языке ДКА: задача с кодом 1 отменена, она имеет описание 5, срок ее реализации 123, она связана со стратегией XXX. ",
    "task(123). description(task(123), 'тут описание'). deadline(task(123), '22.01.2024'). realize(task(123), strategy(567)). это код на языке ДКА, переведи его на русский и исключи из ответа сам код",
    "задача с кодом 1 отменена, она имеет описание 5, срок ее реализации 123, она связана со стратегией XXX. какая информация в этом тексте относится к стратегии на языке ДКА ?",
    "task(123). description(task(123), 'тут описание'). deadline(task(123), '22.01.2024'). realize(task(123), strategy(567)). это текст на языке ДКА. какая информация в этом тексте относится к стратегии?"
    #"текст на языке ДКА c полным описанием задачи: status(task(1), xxx). задача описана полностью ? покажи все ошибки"
    ]
"""

software = ["1c зуп", "nginx", "postgres", "js", "sharepoint", "typescript"]

questions = [
    "Какая компания является производителем этого програмного обеспечения?",
    "Это свободное програмное обеспечение или коммерческое?",
    "У этого програмного обеспечения открытые или закрытые исхродные коды?",
    "Какая лицензия используется для распространения этого програмного обеспечения?"
]
for name in software:
    question = "Название програмного обеспечения - {}. {}".format(name, " ".join(questions))   
    print("---------------------")
    print("[ Request  > ]", question)
    print("---------------------")
    response = getResponse(gcConfig, language, question)
    response = json.loads(response)
    response = response["choices"][0]["message"]["content"]
    print("[ GigaChat < ]", response)
    print("")

