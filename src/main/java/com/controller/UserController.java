package com.controller;

import com.entity.User;
import com.service.UserService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (User)表控制层
 *
 * @author makejava
 * @since 2019-01-26 09:01:18
 */
@RestController
@RequestMapping("/user")
public class UserController {
    /**
     * 服务对象
     */
    @Resource
    private UserService userService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("/selectOne")
    public User selectOne(Integer id) {
        return this.userService.queryById(id);
    }

    @RequestMapping("/selectByName")
    public Map selectOneByName(String name) {
        HashMap map=new HashMap();
        List<User> list =this.userService.queryByName(name);
        map.put("list",list);
        return map;
    }

    @RequestMapping("/allUser")
    public ModelAndView list() {
        ModelAndView mv = new ModelAndView();
        List<User> list = userService.queryAllByLimit(0,100);
        mv.addObject("list", list);
        mv.setViewName("allUser");
        return mv;
    }

    @RequestMapping("/toAddUser")
    public ModelAndView toAddUser() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("addUser");
        return mv;
    }

    @RequestMapping("/addUser")
    @ResponseBody
    public Map addUser(User user) {
        HashMap map=new HashMap();
        try{
            userService.insert(user);
        }catch (Exception e){
            e.getStackTrace();
            map.put("flag","ERROR");
            return map;
        }
        map.put("flag","SUCCESS");
        return map;
    }

    @RequestMapping("/del/{id}")
    @ResponseBody
    public Map deleteUser(@PathVariable("id") Integer id) {
        HashMap map=new HashMap();
        try{
            userService.deleteById(id);
        }catch (Exception e){
            e.getStackTrace();
            map.put("flag","ERROR");
            return map;
        }
        map.put("flag","SUCCESS");
        return map;
    }

    @RequestMapping("/toUpdateUser")
    public ModelAndView toUpdateUser(Integer id) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("user", userService.queryById(id));
        mv.setViewName("updateUser");
        return mv;
    }

    @RequestMapping("/updateUser")
    @ResponseBody
    public Map updateUser(User user) {
        HashMap map=new HashMap();
        try{
            user=userService.update(user);
        }catch (Exception e){
            e.getStackTrace();
            map.put("flag","ERROR");
            return map;
        }
        map.put("flag","SUCCESS");
        return map;
    }
}