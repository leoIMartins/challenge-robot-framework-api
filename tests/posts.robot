*** Settings ***
Documentation          Test scenarios of API https://jsonplaceholder.typicode.com/posts

Resource               ../resources/base.resource

*** Variables ***
${BASE_URL}            https://jsonplaceholder.typicode.com/posts/

*** Test Cases ***
View user by ID
    [Tags]    get_by_id

    ${data}        Get fixtures    users    existing_user

    ${response}    GET     url=${BASE_URL}${data}[user][id]
    ...     expected_status=200
    Should Be Equal As Strings     ${response.json()}[userId]   ${data}[user][userId]
    Should Be Equal As Strings     ${response.json()}[id]       ${data}[user][id]
    Should Be Equal                ${response.json()}[title]    ${data}[user][title]
    Should Be Equal                ${response.json()}[body]     ${data}[user][body]

Create a new user
    [Tags]    post

    ${data}        Get fixtures    users    new_user

    ${response}    POST    url=${BASE_URL}
    ...     json=${data}[user]
    ...     expected_status=201
    Should Be Equal    ${response.json()}[userId]    ${data}[user][userId]
    Should Be Equal    ${response.json()}[title]     ${data}[user][title]
    Should Be Equal    ${response.json()}[body]      ${data}[user][body]
