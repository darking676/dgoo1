package com.acorn.unicorn.aspect;


import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
public class AopClass {
	
   @Around("execution(public * insertCart(..)) || execution(public * WishListView(..)) || execution(public * WishListView2(..))")
   public Object loginAop(ProceedingJoinPoint joinPoint) throws Throwable {
		Object obj = null;

		Object[] ob = joinPoint.getArgs();
		HttpSession session = (HttpSession) ob[0];

		// session check 후 로그인하지 않은경우
		if (session.getAttribute("userid") == null) {
			obj = new ModelAndView("redirect:/Login.do");
		} else {
			obj = joinPoint.proceed();
		}

		return obj;
   }
}
