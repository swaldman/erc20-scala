package com.mchange.sc.v2.erc20.contract

import org.specs2._

class UnexpectedTokenHandlerSpec extends Specification { def is = s2"""
  An UnexpectedTokenHandler...
      should not treat an address not marked expected as expected   ${e1}   
  """

  import Testing.Implicits._

  val contract = UnexpectedTokenHandler( Testing.TestSender(0).contractAddress(2) )

  def e1 : Boolean = !contract.constant.isExpectedToken( Testing.TestSender(1).address ) 
}

