package com.mchange.sc.v2.erc20.contract

import org.specs2._
import Testing._

import com.mchange.sc.v1.consuela.ethereum.stub
import com.mchange.sc.v1.consuela.ethereum.stub.sol

class UnexpectedTokenHandlerSpec extends Specification with AutoSender { def is = s2"""
  An UnexpectedTokenHandler...
      should not treat an address not marked expected as expected         ${e1}
      should let the unexpected token owner call withdraw                 ${e3}  
      should not let anyone but the unexpected token owner call withdraw  ${e3}  
      should "accept" (but really can't refuse) a transfer of tokens      ${e4}  
  """

  val tt1Address = TestSender(0).contractAddress(0)
  val tt2Address = TestSender(0).contractAddress(1)
  val uthAddress = TestSender(0).contractAddress(2)

  val tt1 = TestToken1( tt1Address )
  val tt2 = TestToken2( tt2Address )
  val uth = UnexpectedTokenHandler( uthAddress )

  val randomSender = createRandomSender()

  def e1 : Boolean = !uth.constant.isExpectedToken( randomSender.address )

  def e2 : Boolean = {
    uth.transaction.withdrawUnexpectedToken( tt1Address )( TestSender(0) )
    true
  }

  def e3 : Boolean = {
    try {
      uth.transaction.withdrawUnexpectedToken( tt1Address )( randomSender )
      false
    }
    catch {
      case e : Exception => true
    }
  }

  def e4 : Boolean = {
    val initialUthTestToken2Balance = tt2.constant.balanceOf( uthAddress )
    tt2.transaction.transfer( uthAddress, sol.UInt( 100 ) )
    tt2.constant.balanceOf( uthAddress ).widen == initialUthTestToken2Balance.widen + 100
  }
}

