*** Settings ***
Library        String

Resource  page_objects/result_page.resource

*** Keywords ***
I should see ${EXPECTED} paras
  ${PARAGRAPHS} =  Get Element Count   ${PARAGRAPHS_LIST}
  Should Be Equal As Integers          ${PARAGRAPHS}    ${EXPECTED}
  
I should see ${EXPECTED} words
  ${PARAGRAPH} =     Get Text          ${PARAGRAPHS_LIST}
  ${WORDS_LIST} =    Split String      ${PARAGRAPH}
  ${QTD_OF_WORDS} =  Get Length        ${WORDS_LIST}
  Should Be Equal As Integers          ${QTD_OF_WORDS}    ${EXPECTED}

I should see ${EXPECTED} bytes of text
  No Operation    

I should see ${EXPECTED} lists
  ${LISTS} =  Get Element Count        ${LISTS_LIST}
  Should Be Equal As Integers          ${LISTS}    ${EXPECTED}

I should see ipsum starting with "${UNEXPECTED_TEXT}"
  ${GENERATED_IPSUM} =    Get Text              ${FIRST_PARAGRAPH}
  Should Start With       ${GENERATED_IPSUM}    ${UNEXPECTED_TEXT}

I should not see ipsum starting with "${UNEXPECTED_TEXT}"
  ${GENERATED_IPSUM} =     Get Text              ${FIRST_PARAGRAPH}
  Should Not Start With    ${GENERATED_IPSUM}    ${UNEXPECTED_TEXT}