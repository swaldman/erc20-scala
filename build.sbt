name := "erc20-scala"

organization := "mchange.com"

version := "0.0.1-SNAPSHOT"

scalaVersion := "2.12.4"

resolvers += ("releases" at "https://oss.sonatype.org/service/local/staging/deploy/maven2")

resolvers += ("snapshots" at "https://oss.sonatype.org/content/repositories/snapshots")

resolvers += ("Typesafe repository" at "http://repo.typesafe.com/typesafe/releases/")

ethcfgScalaStubsPackage := "com.mchange.sc.v2.erc20.contract"

Test/ethcfgAutoSpawnContracts := Seq( "TestToken1", "TestToken2", "UnexpectedTokenHandler 0xa86b18b108a20dd389c9a96b59e75ea1ce799581" ) // owner is TestSender(1), private key 0x7e58

libraryDependencies += "org.specs2" %% "specs2-core" % "4.0.2" % "test"

