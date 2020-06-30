package com.demo.controllers;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;
import java.util.stream.IntStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;

@Controller
@RequestMapping("/captcha")
public class CaptchaController {
	
	/**
	 * This method will set the CAPTCHA to decorated text.It will draw string of CAPTCHA generated to image.
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(method = RequestMethod.GET,value="/generateCaptcha")
	public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("image/jpg");
		Random randChars = new Random();
		int lengthOfCaptcha= 6;
		String captcha=getRandomGeneratedCaptcha(lengthOfCaptcha,randChars);
		int iHeight = 40;
		int iWidth = 150;
		Font fntStyle1 = new Font("Arial", Font.BOLD, 30);
		BufferedImage biImage = new BufferedImage(iWidth, iHeight, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2dImage = (Graphics2D) biImage.getGraphics();
		int iCircle = 15;
		for (int i = 0; i < iCircle; i++) {
			g2dImage.setColor(new Color(randChars.nextInt(255), randChars.nextInt(255), randChars.nextInt(255)));
		}
		g2dImage.setFont(fntStyle1);
		for (int i = 0; i < lengthOfCaptcha; i++) {
			g2dImage.setColor(new Color(randChars.nextInt(255), randChars.nextInt(255), randChars.nextInt(255)));
			if (i % 2 == 0) {
				g2dImage.drawString(captcha.substring(i, i + 1), 25 * i, 24);
			} else {
				g2dImage.drawString(captcha.substring(i, i + 1), 25 * i, 35);
			}
		}
		OutputStream osImage = response.getOutputStream();
		ImageIO.write(biImage, "jpeg", osImage);
		g2dImage.dispose();
		HttpSession session = request.getSession();
		session.setAttribute("captcha_security", captcha);
	}
    /**
     * This method will return the String of random Generated CAPTCHA of desired length.
     * @param lengthOfCaptcha
     * @param randChars
     * @return
     */
	private String getRandomGeneratedCaptcha(int lengthOfCaptcha,Random randChars) {
		
		StringBuffer captchaBuffer=new StringBuffer();
		IntStream.rangeClosed(1, lengthOfCaptcha).forEach(length ->
		{
			int charEle=0;
			int getRandomChar=Math.abs(randChars.nextInt())%62;
			charEle=getRandomChar < 26 ? 65+getRandomChar :getRandomChar<52 ? 97+(getRandomChar-26): 48+(getRandomChar-52) ;
			captchaBuffer.append((char)charEle);
		}
				);
		return captchaBuffer.toString();
	}

}
