using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Utility.Extension
{
	public class MailBase
	{

		public MailBase()
		{
		}
		public string AppUrl
		{
			get
			{
				return ConfigurationManager.AppSettings["AppUrl"];
			}
			set
			{
				AppUrl = value;
			}
		}
		public string FileUrl
		{
			get
			{
				return ConfigurationManager.AppSettings["FileUrl"];
			}
			set
			{
				FileUrl = value;
			}
		}
	}
}