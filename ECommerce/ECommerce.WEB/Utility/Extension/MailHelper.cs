using RazorEngine;
using RazorEngine.Templating;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace ECommerce.WEB.Utility.Extension
{
	/// <summary>
	/// Mail gönderimi için oluşturulmuş yardımcı sınıf
	/// </summary>
	public class MailHelper
	{
		private static MailHelper _instance;
		private string _rootPath = "~/Utility/Extension/Mail/View/";
		private string _fileExt = "cshtml";
		private string _host = "smtp@gmail.com";
		private string _port = "587";
		private string _enableSSL = "true";
		private string _useDefaultCredentials = "false";
		private string _domain = string.Empty;
		private string _username = "doyounowthese@gmail.com";
		private string _password = "ibanez756q7";
		private string _sendFrom = "doyounowthese@gmail.com";
		private string _sendName = "E Ticaret";
		private Dictionary<string, string> _templates;
		/// <summary>
		/// Constructor metodudur.
		/// </summary>
		protected MailHelper()
		{
			_templates = new Dictionary<string, string>();

			var appSettings = ConfigurationManager.AppSettings;
			_rootPath = appSettings["MailTemplateRootPath"];
			_fileExt = appSettings["MailTemplateFileExt"];
			_host = appSettings["MailHost"];
			_domain = appSettings["MailDomain"];
			_username = appSettings["MailUsername"];
			_password = appSettings["MailPassword"];
			_port = appSettings["MailPort"];
			_sendFrom = appSettings["MailSendFrom"];
			_sendName = appSettings["MailSendName"];
			_enableSSL = appSettings["MailEnableSSL"];
			_useDefaultCredentials = appSettings["MailUseDefaultCredentials"];
		}
		/// <summary>
		/// Singleton için instance metodu
		/// </summary>
		/// <returns>Geriye MailHelper instance'ı döndürür.</returns>
		public static MailHelper Instance()
		{
			if (_instance == null)
			{
				_instance = new MailHelper();
			}

			return _instance;
		}
		/// <summary>
		/// Template içeriğini okuyan sınıftır.
		/// </summary>
		/// <param name="templateName">Template ismi üzerinden web.config'de belirtilen rootpath ve file extension ile ilgili dosyayı bulur.</param>
		/// <returns>Geriye string olarak template içeriğini döndürür.</returns>
		private string GetTemplate(string templateName)
		{
			string body = "";
			if (_templates.ContainsKey(templateName))
			{
				body = _templates[templateName];
			}
			else
			{
				var path = Path.Combine(_rootPath, templateName + "." + _fileExt);
				body = File.ReadAllText(System.Web.HttpContext.Current.Server.MapPath(path));
				_templates.Add(templateName, body);
			}
			return body;
		}
		/// <summary>
		/// Razor syntax'ı ile template içeriğini derler.
		/// </summary>
		/// <typeparam name="T">Gönderilen model tipi</typeparam>
		/// <param name="templateSource">Template içeriği</param>
		/// <param name="model">Model</param>
		/// <returns>Geri string olarak derlenmiş template içeriğini döndürür.</returns>
		private string CompileTemplate<T>(string templateSource, object model)
		{
			var body = Engine.Razor.RunCompile(templateSource, Guid.NewGuid().ToString(), typeof(T), model);
			return body;
		}
		/// <summary>
		/// Mail gönderen metod.
		/// </summary>
		/// <param name="message">Gönderilecek mail mesajı</param>
		private void SendMail(MailMessage message)
		{
			using (SmtpClient client = new SmtpClient())
			{
				NetworkCredential credential = new NetworkCredential();
				if (!string.IsNullOrEmpty(_username))
					credential.UserName = _username;
				if (!string.IsNullOrEmpty(_password))
					credential.Password = _password;
				if (!string.IsNullOrEmpty(_domain))
					credential.Domain = _domain;

				client.Credentials = credential;
				if (!string.IsNullOrEmpty(_host))
					client.Host = _host;
				if (!string.IsNullOrEmpty(_port))
					client.Port = Convert.ToInt32(_port);
				if (!string.IsNullOrEmpty(_enableSSL))
					client.EnableSsl = Convert.ToBoolean(_enableSSL);
				//if (!string.IsNullOrEmpty(_useDefaultCredentials))
				//	client.UseDefaultCredentials = Convert.ToBoolean(_useDefaultCredentials);

				client.Send(message);
			}
		}
		/// <summary>
		/// Mail mesajı hazırlayan metodtur.
		/// </summary>
		/// <param name="to">Mail gönderilecek adres.</param>
		/// <param name="subject">Mail konusu</param>
		/// <param name="body">Mail içeriği</param>
		/// <returns>Geriye MailMessage döndürür.</returns>
		private MailMessage Message(string to, string subject, string body)
		{
			MailMessage mailMessage = new MailMessage(_sendFrom, to, subject, body)
			{
				IsBodyHtml = true
			};
			return mailMessage;
		}
		private MailMessage Message(string to, string subject, string body, Attachment attachment)
		{
			MailMessage mailMessage = new MailMessage(_sendFrom, to, subject, body)
			{
				IsBodyHtml = true
			};
			mailMessage.Attachments.Add(attachment);
			return mailMessage;
		}

		private MailMessage Message(string to, string subject, string body, List<Attachment> attachments)
		{
			MailMessage mailMessage = new MailMessage(_sendFrom, to, subject, body)
			{
				IsBodyHtml = true
			};
			foreach (var attachment in attachments)
			{
				mailMessage.Attachments.Add(attachment);
			}
			return mailMessage;
		}


		/// <summary>
		/// Mail gönderme metodudur.
		/// </summary>
		/// <typeparam name="T">Gönderilecek mail modeli</typeparam>
		/// <param name="to">Mail gönderilecek adres</param>
		/// <param name="subject">Mail konusu</param>
		/// <param name="templateName">Template ismi</param>
		/// <param name="model">Mail modeli</param>
		/// <returns>Geriye işlem başarılı(true) yada başarısız (false) olarak değer döndürür.</returns>
		public bool Send<T>(string to, string subject, string templateName, T model)
		{
			try
			{
				var template = GetTemplate(templateName);
				var body = CompileTemplate<T>(template, model);
				var message = Message(to, subject, body);
				SendMail(message);
				return true;
			}
			catch (Exception ex)
			{
				throw ex;
				return false;
			}
		}

		public bool Send<T>(string to, string subject, string templateName, T model, Attachment attachment)
		{
			try
			{
				var template = GetTemplate(templateName);
				var body = CompileTemplate<T>(template, model);
				var message = Message(to, subject, body, attachment);
				SendMail(message);
				message.Dispose();
				return true;
			}
			catch (Exception ex)
			{
				throw ex;
				return false;
			}
		}

		public bool Send<T>(string to, string subject, string templateName, T model, List<Attachment> attachments)
		{
			try
			{
				var template = GetTemplate(templateName);
				var body = CompileTemplate<T>(template, model);
				var message = Message(to, subject, body, attachments);
				SendMail(message);
				message.Dispose();
				return true;
			}
			catch (Exception ex)
			{
				throw ex;
				return false;
			}
		}
	}
}