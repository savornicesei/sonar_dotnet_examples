namespace WebApplication1.Tests.Models
{
	using System;
	using System.Web;
	using NUnit.Framework;
	using FluentAssertions;
	using Moq;
	using System.Collections.Specialized;

	[TestFixture]
	public class IdentityModelsTests
	{
		[Test]
		public void GetProviderNameFromRequest_IfRequestIsNull_ThrowException()
		{
			//Arrange
			var httpRequest = (HttpRequest)null;

			//Act
			Action action = () => IdentityHelper.GetProviderNameFromRequest(httpRequest);

			//Assert
			action.ShouldThrow<ArgumentNullException>();
		}

		public void GetProviderNameFromRequest_IfRequestIsNotNull_AndQueryStringEmpty_ReturnStringEmpty()
		{
			//Arrange
			var expected = string.Empty;
			var qs = new NameValueCollection(0);
			var httpRequest = new Mock<HttpRequestBase>();
			httpRequest.Setup(r => r.QueryString).Returns(qs);

			//Act
			var result = IdentityHelper.GetProviderNameFromRequest(httpRequest.Object);

			//Assert
			result.Should().BeNull();
		}
	}
}
