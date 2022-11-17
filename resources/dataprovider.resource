*** Settings ***
Library        FakerLibrary

*** Keywords ***
Get random digit
  ${RANDOM_DIGIT} =  FakerLibrary.RandomDigitNotNull
  [Return]           ${RANDOM_DIGIT}