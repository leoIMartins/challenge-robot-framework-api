*** Settings ***
Library        RequestsLibrary
Library        JSONLibrary

*** Keywords ***
Get fixtures
    [Arguments]        ${file_name}        ${scenario}

    ${data}    Load Json From File
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    ...    encoding=utf-8
    
    [Return]    ${data}[${scenario}]
