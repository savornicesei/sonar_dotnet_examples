namespace WebApplication1.Tests
{
	using System;
	using NUnit.Framework;

	[TestFixture]
	public class UnitTest1
	{
		[Test]
		public void Test_AssertTrue()
		{
			Assert.True(true);
		}

		[Test]
		public void Test_AssertInconclusive()
		{
			Assert.Inconclusive();
		}

		[Test]
		public void Test_AssertCommentedOut()
		{
			//Assert.Pass();
		}

		[Test]
		[Ignore("Skip test")]
		public void Test_Ignored()
		{
			Assert.Pass();
		}
	}
}
