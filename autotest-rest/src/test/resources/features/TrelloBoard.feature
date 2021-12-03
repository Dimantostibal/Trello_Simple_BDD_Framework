#language:ru
@test

Функционал: Тестирование сервиса Trello
  - Создать новую доску "KanbanTool"
  - Создать новую колону "Backlog"
  - Добавить карточку в колонку Backlog с названием "Карточка для изучения API"
  - Добавить вложение в виде любой фотографии
  - Поставить срок выполнения на следующий день
  - Добавить описание "Тут будет отмечаться прогресс обучения"
  - Создать чек-лист с пунктами:
                            - Понять протокол HTTP
                            - Выучить методы запросов
  - Отметить пункт в карточке "Понять протокол HTTP"
  - Создать колонку "Done"
  - Переместить карточку в эту колонку
  - Архивировать колонку "Backlog"
  - Отметить пункт в карточке "Выучить методы запросов"
  - Поставить в карточке эмоджи Палец вверх

  Сценарий: Работа с рабочим пространством Trello
    #Создать доску "KanbanTool"
    * создать контекстные переменные
      | token| ""|
      | key  | ""                                |
    * сгенерировать переменные
      | name | KanbanTool |
    * создать запрос
      | method | path    | body             |
      | POST   | /boards | createBoard.json |
    * добавить header
      | Content-Type  | application/json                                     |
      | Authorization | OAuth oauth_consumer_key=${key},oauth_token=${token} |
    * отправить запрос
    * статус код 200
    * извлечь данные
      | nameBoard | $.name |
      | idBoard   | $.id   |
    * сравнить значения
      | ${name} | == | ${nameBoard} |

      #Создать колонку "Backlog"
    * сгенерировать переменные
      | name    | backlog    |
      | idBoard | ${idBoard} |
    * создать запрос
      | method | path   | body            |
      | POST   | /lists | createList.json |
    * добавить header
      | Content-Type  | application/json                                                                                                                                                                                                                                                                                            |
      | Authorization | OAuth oauth_consumer_key=${key},oauth_token=${token} |
    * отправить запрос
    * статус код 200
    * извлечь данные
      | nameListBL | $.name |
      | idListBL   | $.id   |
    * сравнить значения
      | ${name} | == | ${nameListBL} |

      #Добавить карточку в колонку Backlog с названием "Карточка для изучения API"
    * сгенерировать переменные
      | name   | Карточка для изучения API |
      | idList | ${idListBL}               |
    * создать запрос
      | method | path   | body            |
      | POST   | /cards | createCard.json |
    * добавить header
      | Content-Type  | application/json                                                                                                                                                                                                                                                                                            |
      | Authorization | OAuth oauth_consumer_key=${key},oauth_token=${token} |
    * отправить запрос
    * статус код 200
    * извлечь данные
      | nameList | $.name |
      | idCard   | $.id   |
    * сравнить значения
      | ${name} | == | ${nameList} |

      #Добавить вложение в виде любой фотографии
    * создать запрос
      | method | path                         |
      | POST   | /cards/${idCard}/attachments |
    * добавить header
      | Content-Type  | application/json                                                                                                                                                                                                                                                                                            |
      | Authorization | OAuth oauth_consumer_key=${key},oauth_token=${token} |
    * добавить query параметры
      | name | image                                                                                          |
      | url  | https://upload.wikimedia.org/wikipedia/ru/thumb/4/42/Simpsons_cast.jpg/700px-Simpsons_cast.jpg |
    * отправить запрос
    * статус код 200

      #Поставить срок выполнения на следующий день
    * сгенерировать переменные
      | due | 2021-12-04T12:00:00.000Z |
    * создать запрос
      | method | path             | body             |
      | PUT    | /cards/${idCard} | addDeadline.json |
    * добавить header
      | Content-Type  | application/json                                                                                                                                                                                                                                                                                            |
      | Authorization | OAuth oauth_consumer_key=${key},oauth_token=${token} |
    * отправить запрос
    * статус код 200

      #Добавить описание "Тут будет отмечаться прогресс обучения"
    * сгенерировать переменные
      | desc | Тут будет отмечаться прогресс обучения |
    * создать запрос
      | method | path             | body                |
      | PUT    | /cards/${idCard} | addDescription.json |
    * добавить header
      | Content-Type  | application/json                                                                                                                                                                                                                                                                                            |
      | Authorization | OAuth oauth_consumer_key=${key},oauth_token=${token} |
    * отправить запрос
    * статус код 200

      #Создать чек-лист с пунктами:
            #- Понять протокол HTTP
            #- Выучить методы запросов
    * сгенерировать переменные
      | name | Новый чек-лист |
    * создать запрос
      | method | path                        | body                 |
      | POST   | /cards/${idCard}/checklists | createChecklist.json |
    * добавить header
      | Content-Type  | application/json                                                                                                                                                                                                                                                                                            |
      | Authorization | OAuth oauth_consumer_key=${key},oauth_token=${token} |
    * отправить запрос
    * статус код 200
    * извлечь данные
      | idChecklist   | $.id   |
      | nameChecklist | $.name |
    * сравнить значения
      | ${name} | == | ${nameChecklist} |

    #Добавить пункт "Понять протокол HTTP" в чек-лист
    * сгенерировать переменные
      | name | Понять протокол HTTP |
    * создать запрос
      | method | path                                  | body                       |
      | POST   | /checklists/${idChecklist}/checkItems | createItemOfChecklist.json |
    * добавить header
      | Content-Type  | application/json                                                                                                                                                                                                                                                                                            |
      | Authorization | OAuth oauth_consumer_key=${key},oauth_token=${token} |
    * отправить запрос
    * статус код 200
    * извлечь данные
      | idCheckItem1 | $.id |

    #Добавить пункт "Выучить методы запросов" в чек-лист
    * сгенерировать переменные
      | name | Выучить методы запросов |
    * создать запрос
      | method | path                                  | body                       |
      | POST   | /checklists/${idChecklist}/checkItems | createItemOfChecklist.json |
    * добавить header
      | Content-Type  | application/json                                                                                                                                                                                                                                                                                            |
      | Authorization | OAuth oauth_consumer_key=${key},oauth_token=${token} |
    * отправить запрос
    * статус код 200
    * извлечь данные
      | idCheckItem2 | $.id |

    #Отметить пункт в чек-листе
    * сгенерировать переменные
      | state | complete |
    * создать запрос
      | method | path                                                                | body                       |
      | PUT    | /cards/${idCard}/checklist/${idChecklist}/checkItem/${idCheckItem1} | updateItemOfChecklist.json |
    * добавить header
      | Content-Type  | application/json                                                                                                                                                                                                                                                                                            |
      | Authorization | OAuth oauth_consumer_key=${key},oauth_token=${token} |
    * отправить запрос
    * статус код 200

    #Создание колонки Done
    * сгенерировать переменные
      | name    | done       |
      | idBoard | ${idBoard} |
    * создать запрос
      | method | path   | body            |
      | POST   | /lists | createList.json |
    * добавить header
      | Content-Type  | application/json                                                                                                                                                                                                                                                                                            |
      | Authorization | OAuth oauth_consumer_key=${key},oauth_token=${token} |
    * отправить запрос
    * статус код 200
    * извлечь данные
      | nameListDone | $.name |
      | idListDone   | $.id   |
    * сравнить значения
      | ${name} | == | ${nameListDone} |

    #Перенести карточку
    * сгенерировать переменные
      | idListMove | ${idListDone} |
    * создать запрос
      | method | path             | body            |
      | PUT    | /cards/${idCard} | updateCard.json |
    * добавить header
      | Content-Type  | application/json                                                                                                                                                                                                                                                                                            |
      | Authorization | OAuth oauth_consumer_key=${key},oauth_token=${token} |
    * отправить запрос
    * статус код 200
    * извлечь данные
      | idListDoneMove | $.idList |
    * сравнить значения
      | ${idListDone} | == | ${idListDoneMove} |

    #Перенести карточку
    * сгенерировать переменные
      | closed | true |
    * создать запрос
      | method | path               | body            |
      | PUT    | /lists/${idListBL} | updateList.json |
    * добавить header
      | Content-Type  | application/json                                                                                                                                                                                                                                                                                            |
      | Authorization | OAuth oauth_consumer_key=${key},oauth_token=${token} |
    * отправить запрос
    * статус код 200

    #Отметить пункт в чек-листе
    * сгенерировать переменные
      | state | complete |
    * создать запрос
      | method | path                                                                | body                       |
      | PUT    | /cards/${idCard}/checklist/${idChecklist}/checkItem/${idCheckItem2} | updateItemOfChecklist.json |
    * добавить header
      | Content-Type  | application/json                                                                                                                                                                                                                                                                                            |
      | Authorization | OAuth oauth_consumer_key=${key},oauth_token=${token} |
    * отправить запрос
    * статус код 200

    #Поставить эмодзи
    * сгенерировать переменные
      | text | :thumbsup: |
    * создать запрос
      | method | path                             | body               |
      | POST   | cards/${idCard}/actions/comments | createComment.json |
    * добавить header
      | Content-Type  | application/json                                                                                                                                                                                                                                                                                            |
      | Authorization | OAuth oauth_consumer_key=${key},oauth_token=${token} |
    * отправить запрос
    * статус код 200