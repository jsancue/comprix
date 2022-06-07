package utils;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EnviarEmail {
	private String userEmail;
	private String myHash;

	public EnviarEmail(String userEmail, String hash) {
		this.userEmail = userEmail;
		this.myHash = hash;
	}

	public void enviarEMail() {
		// Enter the email address and password for the account from which verification
		// link will be send
		final String email = "noreplycomprix@yahoo.com";
		final String password = "qohfxpxwxjbwbwnw";

		Properties propiedades = new Properties();

		propiedades.setProperty("mail.smtp.host", "smtp.mail.yahoo.com");
		propiedades.setProperty("mail.smtp.ssl.trust", "smtp.mail.yahoo.com");
		propiedades.setProperty("mail.smtp.port", "587");
		propiedades.setProperty("mail.smtp.auth", "true");
		propiedades.setProperty("mail.smtp.starttls.enable", "true");

		Session sesion = Session.getInstance(propiedades, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(email, password);
			}
		});

		try {

			MimeMessage mensaje = new MimeMessage(sesion);

			mensaje.setFrom(new InternetAddress(email));
			mensaje.setRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));

			mensaje.setSubject("Comprix - Activar Cuenta");
			/*
			 * mensaje.
			 * setText("Haz click en el enlace para verificar tu cuenta y terminar de configurarla."
			 * + "\n\nLink de Verificacion: " + "http://localhost:8088/ActivarCuenta?key1="
			 * + userEmail + "&key2=" + myHash);
			 */
			mensaje.setContent("<!DOCTYPE html>\n" + "<html>\n" + "	<head>\n" + "		<title>\n"
					+ "			Activar Cuenta\n" + "		</title>\n" + "		<meta charset=\"UTF-8\">\n"
					+ "		<meta content=\"IE=edge\" http-equiv=\"X-UA-Compatible\">\n"
					+ "		<meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\">\n"
					+ "		<style type=\"text/css\">\n" + "		             @media screen {\n"
					+ "		               @font-face {\n" + "		                 font-family: \"Lato\";\n"
					+ "		                 font-style: normal;\n" + "		                 font-weight: 400;\n"
					+ "		                 src: local(\"Lato Regular\"), local(\"Lato-Regular\"),\n"
					+ "		                   url(https://fonts.gstatic.com/s/lato/v11/qIIYRU-oROkIk8vfvxw6QvesZW2xOQ-xsNqO47m55DA.woff)\n"
					+ "		                     format(\"woff\");\n" + "		               }\n" + "\n"
					+ "		               @font-face {\n" + "		                 font-family: \"Lato\";\n"
					+ "		                 font-style: normal;\n" + "		                 font-weight: 700;\n"
					+ "		                 src: local(\"Lato Bold\"), local(\"Lato-Bold\"),\n"
					+ "		                   url(https://fonts.gstatic.com/s/lato/v11/qdgUG4U09HnJwhYI-uK18wLUuEpTyoUstqEm5AMlJo4.woff)\n"
					+ "		                     format(\"woff\");\n" + "		               }\n" + "\n"
					+ "		               @font-face {\n" + "		                 font-family: \"Lato\";\n"
					+ "		                 font-style: italic;\n" + "		                 font-weight: 400;\n"
					+ "		                 src: local(\"Lato Italic\"), local(\"Lato-Italic\"),\n"
					+ "		                   url(https://fonts.gstatic.com/s/lato/v11/RYyZNoeFgb0l7W3Vu1aSWOvvDin1pK8aKteLpeZ5c0A.woff)\n"
					+ "		                     format(\"woff\");\n" + "		               }\n" + "\n"
					+ "		               @font-face {\n" + "		                 font-family: \"Lato\";\n"
					+ "		                 font-style: italic;\n" + "		                 font-weight: 700;\n"
					+ "		                 src: local(\"Lato Bold Italic\"), local(\"Lato-BoldItalic\"),\n"
					+ "		                   url(https://fonts.gstatic.com/s/lato/v11/HkF_qI1x_noxlxhrhMQYELO3LdcAZYWl9Si6vvxL-qU.woff)\n"
					+ "		                     format(\"woff\");\n" + "		               }\n"
					+ "		             }\n" + "\n" + "		             /* CLIENT-SPECIFIC STYLES */\n"
					+ "		             body,\n" + "		             table,\n" + "		             td,\n"
					+ "		             a {\n" + "		               -webkit-text-size-adjust: 100%;\n"
					+ "		               -ms-text-size-adjust: 100%;\n" + "		             }\n" + "\n"
					+ "		             table,\n" + "		             td {\n"
					+ "		               mso-table-lspace: 0pt;\n" + "		               mso-table-rspace: 0pt;\n"
					+ "		             }\n" + "\n" + "		             img {\n"
					+ "		               -ms-interpolation-mode: bicubic;\n" + "		             }\n" + "\n"
					+ "		             /* RESET STYLES */\n" + "		             img {\n"
					+ "		               border: 0;\n" + "		               height: auto;\n"
					+ "		               line-height: 100%;\n" + "		               outline: none;\n"
					+ "		               text-decoration: none;\n" + "		             }\n" + "\n"
					+ "		             table {\n" + "		               border-collapse: collapse !important;\n"
					+ "		             }\n" + "\n" + "		             body {\n"
					+ "		               height: 100% !important;\n" + "		               margin: 0 !important;\n"
					+ "		               padding: 0 !important;\n"
					+ "		               width: 100% !important;\n" + "		             }\n" + "\n"
					+ "		             /* iOS BLUE LINKS */\n" + "		             a[x-apple-data-detectors] {\n"
					+ "		               color: inherit !important;\n"
					+ "		               text-decoration: none !important;\n"
					+ "		               font-size: inherit !important;\n"
					+ "		               font-family: inherit !important;\n"
					+ "		               font-weight: inherit !important;\n"
					+ "		               line-height: inherit !important;\n" + "		             }\n" + "\n"
					+ "		             /* MOBILE STYLES */\n"
					+ "		             @media screen and (max-width: 600px) {\n" + "		               h1 {\n"
					+ "		                 font-size: 32px !important;\n"
					+ "		                 line-height: 32px !important;\n" + "		               }\n"
					+ "		             }\n" + "\n" + "		             /* ANDROID CENTER FIX */\n"
					+ "		             div[style*=\"margin: 16px 0;\"] {\n"
					+ "		               margin: 0 !important;\n" + "		             }\n" + "		</style>\n"
					+ "	</head>\n"
					+ "	<body style=\" background-color: #f6f6f6; margin: 0 !important; padding: 0 !important;\">\n"
					+ "		<!-- HIDDEN PREHEADER TEXT -->\n"
					+ "		<div style=\" display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: 'Lato', Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\">\n"
					+ "			¡Estamos encantados de tenerte aquí! Prepárese para sumergirse en su nueva cuenta.\n"
					+ "		</div>\n"
					+ "		<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n"
					+ "			<!-- LOGO -->\n" + "			<tr>\n"
					+ "				<td align=\"center\" bgcolor=\"#27AE60\">\n"
					+ "					<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 600px\" width=\"100%\">\n"
					+ "						<tr>\n"
					+ "							<td align=\"center\" style=\"padding: 40px 10px 40px 10px\" valign=\"top\"></td>\n"
					+ "						</tr>\n" + "					</table>\n" + "				</td>\n"
					+ "			</tr>\n" + "			<tr>\n"
					+ "				<td align=\"center\" bgcolor=\"#27AE60\" style=\"padding: 0px 10px 0px 10px\">\n"
					+ "					<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 600px\" width=\"100%\">\n"
					+ "						<tr>\n"
					+ "							<td align=\"center\" bgcolor=\"#FFFFFF\" style=\" padding: 40px 20px 20px 20px; border-radius: 4px 4px 0px 0px; color: #333; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; line-height: 48px;\" valign=\"top\">\n"
					+ "								<h1 style=\"font-size: 48px; font-weight: 400; margin: 2\">\n"
					+ "									Bienvenido a Comprix\n"
					+ "								</h1><img height=\"150\" src=\"data/activado.svg\" style=\"display: block; border: 0px\" width=\"150\">\n"
					+ "							</td>\n" + "						</tr>\n"
					+ "					</table>\n" + "				</td>\n" + "			</tr>\n"
					+ "			<tr>\n"
					+ "				<td align=\"center\" bgcolor=\"#F6F6F6\" style=\"padding: 0px 10px 0px 10px\">\n"
					+ "					<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 600px\" width=\"100%\">\n"
					+ "						<tr>\n"
					+ "							<td align=\"left\" bgcolor=\"#FFFFFF\" style=\" padding: 20px 30px 40px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;\">\n"
					+ "								<p style=\"margin: 0\">\n"
					+ "									Estamos muy contentos de que te unas a la familia de Comprix. Primero, necesitas confirmar tu cuenta. Haz click en el boton de abajo.\n"
					+ "								</p>\n" + "							</td>\n"
					+ "						</tr>\n" + "						<tr>\n"
					+ "							<td align=\"left\" bgcolor=\"#FFFFFF\">\n"
					+ "								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n"
					+ "									<tr>\n"
					+ "										<td align=\"center\" bgcolor=\"#FFFFFF\" style=\"padding: 20px 30px 60px 30px\">\n"
					+ "											<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n"
					+ "												<tr>\n"
					+ "													<td align=\"center\" bgcolor=\"#27AE60\" style=\"border-radius: 3px\">\n"
					+ "														<a href=\"http://localhost:8080/ActivarCuenta?key1="
					+ userEmail + "&key2=" + myHash
					+ "\" style=\" font-size: 20px; font-family: Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; color: #ffffff; text-decoration: none; padding: 15px 25px; border-radius: 2px; border: 1px solid #27ae60; display: inline-block;\" target=\"_blank\">Confirmar Cuenta</a>\n"
					+ "													</td>\n"
					+ "												</tr>\n"
					+ "											</table>\n"
					+ "										</td>\n" + "									</tr>\n"
					+ "								</table>\n" + "							</td>\n"
					+ "						</tr><!-- COPY -->\n" + "						<tr>\n"
					+ "							<td align=\"left\" bgcolor=\"#FFFFFF\" style=\" padding: 0px 30px 0px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;\">\n"
					+ "								<p style=\"margin: 0\">\n"
					+ "									Si el botón no funciona haz click en el siguiente enlace:\n"
					+ "								</p>\n" + "							</td>\n"
					+ "						</tr><!-- COPY -->\n" + "						<tr>\n"
					+ "							<td align=\"left\" bgcolor=\"#FFFFFF\" style=\" padding: 20px 30px 20px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;\">\n"
					+ "								<p style=\"margin: 0\">\n"
					+ "									<a href=\"http://localhost:8080/ActivarCuenta?key1=" + userEmail
					+ "&key2=" + myHash
					+ "\" style=\"color: #27ae60\" target=\"_blank\">https://comprix.com/activarcuenta</a>\n"
					+ "								</p>\n" + "							</td>\n"
					+ "						</tr>\n" + "						<tr>\n"
					+ "							<td align=\"left\" bgcolor=\"#FFFFFF\" style=\" padding: 0px 30px 20px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;\">\n"
					+ "								<p style=\"margin: 0\">\n"
					+ "									Si tienes alguna duda no olvide contactar con el equipo de Comprix a traves de la página web, o respondiendo a este email.\n"
					+ "								</p>\n" + "							</td>\n"
					+ "						</tr>\n" + "						<tr>\n"
					+ "							<td align=\"left\" bgcolor=\"#FFFFFF\" style=\" padding: 0px 30px 40px 30px; border-radius: 0px 0px 4px 4px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;\">\n"
					+ "								<p style=\"margin: 0\">\n"
					+ "									Saludos,<br>\n"
					+ "									Equipo de Comprix\n" + "								</p>\n"
					+ "							</td>\n" + "						</tr>\n"
					+ "					</table>\n" + "				</td>\n" + "			</tr>\n"
					+ "			<tr>\n"
					+ "				<td align=\"center\" bgcolor=\"#F6F6F6\" style=\"padding: 30px 10px 0px 10px\">\n"
					+ "					<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 600px\" width=\"100%\">\n"
					+ "						<tr>\n"
					+ "							<td align=\"center\" bgcolor=\"#FFECD1\" style=\" padding: 30px 30px 30px 30px; border-radius: 4px 4px 4px 4px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;\">\n"
					+ "								<h2 style=\" font-size: 20px; font-weight: 400; color: #111111; margin: 0;\">\n"
					+ "									¿Necesitas ayuda?\n" + "								</h2>\n"
					+ "								<p style=\"margin: 0\">\n"
					+ "									<a href=\"#\" style=\"color: #27ae60\" target=\"_blank\">Estamos aquí para ayudarte.</a>\n"
					+ "								</p>\n" + "							</td>\n"
					+ "						</tr>\n" + "					</table>\n" + "				</td>\n"
					+ "			</tr>\n" + "		</table>\n" + "	</body>\n" + "</html>", "text/html; charset=UTF-8");

			Transport.send(mensaje);

			System.out.println("Enviado Correo de Verificacion con Éxito");

		} catch (Exception e) {
			System.out.println("Error at SendingEmail.java: " + e);
		}

	}
}
