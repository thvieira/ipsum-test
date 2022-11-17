*** Settings ***
Documentation  Lorem ipsum generator web intarface testing
Default Tags   ipsum  generator

Library        SeleniumLibrary

Resource       ../resources/configs/default_config.resource
Resource       ../resources/dataprovider.resource
Resource       ../resources/generator.resource
Resource       ../resources/navigation.resource
Resource       ../resources/verification_points.resource

Test Setup     Open Browser        browser=${BROWSER}
Test Teardown  Close All Browsers    

*** Test case ***
Scenario 01: Paragraphs generator
  [Tags]                  paragraphs
  ${QTD_OF_PARAGRAPHS} =  Get random digit

  Given I am at Lorem ipsum home page
   When I ask for ${QTD_OF_PARAGRAPHS} paras
    And I generate ipsum
   Then I wait for page load
    And I should see ${QTD_OF_PARAGRAPHS} paras

Scenario 02: Words generator
  [Tags]             words
  ${QTD_OF_WORDS} =  Get random digit
  
  Given I am at Lorem ipsum home page
   When I ask for ${QTD_OF_WORDS} words
    And I choose words option
    And I generate ipsum
   Then I wait for page load
    And I should see ${QTD_OF_WORDS} words

Scenario 03: Bytes generator
  [Tags]             bytes  skip
  ${QTD_OF_BYTES} =  Get random digit
  
  Given I am at Lorem ipsum home page
   When I ask for ${QTD_OF_BYTES} bytes
    And I choose bytes option
    And I generate ipsum
   Then I wait for page load
    And I should see ${QTD_OF_BYTES} bytes of text

Scenario 04: Lists generator
  [Tags]             lists
  ${QTD_OF_LISTS} =  Get random digit
  
  Given I am at Lorem ipsum home page
   When I ask for ${QTD_OF_LISTS} lists
    And I choose lists option
    And I generate ipsum
   Then I wait for page load
    And I should see ${QTD_OF_LISTS} lists

Scenario 05: Starts with lorem
  [Tags]             starts-with  

  Given I am at Lorem ipsum home page
    And I generate ipsum
   Then I wait for page load
    And I should see ipsum starting with "Lorem ipsum dolor sit amet" 
  
Scenario 06: Not starts with lorem
  [Tags]             starts-with  

  Given I am at Lorem ipsum home page
   When I uncheck "Starts with lorem" option
    And I generate ipsum
   Then I wait for page load
    And I should not see ipsum starting with "Lorem ipsum dolor sit amet" 
  