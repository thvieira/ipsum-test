*** Settings ***
Resource  page_objects/home_page.resource

*** Keywords ***
I ask for ${QTD} ${TYPE_OF_RESOURCE}
  Log Many         "Generating "         ${QTD}  ${TYPE_OF_RESOURCE}
  Input Text       ${AMOUNT_TEXT_FIELD}  ${QTD}

I generate ipsum
  Click Element    ${GENERATE_BUTTON}

I choose ${OPTION} option
  Log Variables
  Click Element    ${OPTION}
  