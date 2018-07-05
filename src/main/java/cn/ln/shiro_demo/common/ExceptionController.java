package cn.ln.shiro_demo.common;

import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionController {

    @ExceptionHandler(value = UnauthorizedException.class)
    public String defaultErrorHandler(){
        return "403";
    }
}
