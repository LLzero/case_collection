package com.casecollection.backend.framework.util;

import com.casecollection.backend.framework.exception.BusinessException;
import org.springframework.beans.BeanUtils;

import java.lang.reflect.Field;
import java.util.*;

/**
 *
 */
public class ListUtil {
    /**
     * 将list中元素对象转换为指定一个元素对象
     * @param sourceList
     * @param clazz
     * @param <T>
     * @return
     */
    public static <K,T> List<T> convertList(List<K> sourceList, Class<T> clazz) {
        List<T> list = new ArrayList<>();
        if(isEmpty(sourceList)){
            return list;
        }
        for(K k:sourceList ){
            try {
                T t = clazz.newInstance();
                BeanUtils.copyProperties(k,t);
                list.add(t);
            } catch (Exception e) {
                throw new BusinessException("对象转换错误",e);
            }
        }

        return list;
    }

    /**
     * 获取list中元素中指定属性的值集合
     * @param sourceList
     * @param fileldName
     * @param <T>
     * @return
     */
    public static <K,T> List<T> getValues(List<K> sourceList, String fileldName) {
        Set<T> set = new HashSet<>();
        if(isEmpty(sourceList)){
            return new ArrayList<>(set);
        }
        Class elemeClazz = sourceList.get(0).getClass();
        Field field = null;
        try {
            field = elemeClazz.getDeclaredField(fileldName);
            field.setAccessible(true);
        } catch (Exception e) {
            throw new BusinessException("属性不存在",e);
        }
        for(K k:sourceList ){
            try {
                T t = (T) field.get(k);
                if(t!=null){

                }set.add(t);
            } catch (Exception e) {
                throw new BusinessException("获取属性错误",e);
            }
        }
        return new ArrayList<>(set);
    }
    
    /**
     * 获取list中元素中指定属性的值集合
     * @param sourceList
     * @param fileldName
     * @param <T>
     * @return
     */
    public static <K,T> List<T> getUnSafeValues(List<K> sourceList, String fileldName) {
        Set<T> set = new HashSet<>();
        if(isEmpty(sourceList)){
            return new ArrayList<>(set);
        }
        Class elemeClazz = sourceList.get(0).getClass();
        Field field = null;
        try {
            field = elemeClazz.getDeclaredField(fileldName);
            field.setAccessible(true);
        } catch (Exception e) {
            try {
            	elemeClazz = elemeClazz.getSuperclass();
            	field = elemeClazz.getDeclaredField(fileldName);
                field.setAccessible(true);
            }
            catch (Exception e2) {
            	throw new BusinessException("属性不存在",e);
            }
        }
        for(K k:sourceList ){
            try {
                T t = (T) field.get(k);
                if(t!=null){

                }set.add(t);
            } catch (Exception e) {
                throw new BusinessException("获取属性错误",e);
            }
        }
        return new ArrayList<>(set);
    }
    

    /**
     * 以元素中某个属性为key，转换为一个map
     * 如有两个元素中属性key一样，后面的会覆盖前面的
     * @param sourceList
     * @param key
     * @param <K>
     * @param <T>
     * @return
     */
    public static <K,T> Map<K,T> convertToMap(List<T> sourceList, String key) {
        Map<K,T> map = new HashMap<>();
        if(isEmpty(sourceList)){
            return map;
        }
        Class elemeClazz = sourceList.get(0).getClass();
        Field field = null;
        try {
            field = elemeClazz.getDeclaredField(key);
            field.setAccessible(true);
        } catch (Exception e) {
            throw new BusinessException("属性不存在",e);
        }
        for(T t:sourceList ){
            try {
                K k = (K) field.get(t);
                map.put(k, t);
            } catch (Exception e) {
                throw new BusinessException("获取属性错误",e);
            }
        }
        return map;
    }
    
    /**
     * 以元素中某个属性为key，转换为一个map
     * 如有两个元素中属性key一样，后面的会覆盖前面的
     * @param sourceList
     * @param key
     * @param <K>
     * @param <T>
     * @return
     */
    public static <K,T> Map<K,T> convertToUnSafeMap(List<T> sourceList, String key) {
        Map<K,T> map = new HashMap<>();
        if(isEmpty(sourceList)){
            return map;
        }
        Class elemeClazz = sourceList.get(0).getClass();
        Field field = null;
        try {
            field = elemeClazz.getDeclaredField(key);
            field.setAccessible(true);
        } catch (Exception e) {
        	try {
            	elemeClazz = elemeClazz.getSuperclass();
            	field = elemeClazz.getDeclaredField(key);
                field.setAccessible(true);
            }
            catch (Exception e2) {
            	throw new BusinessException("属性不存在",e);
            }
        }
        for(T t:sourceList ){
            try {
                K k = (K) field.get(t);
                map.put(k, t);
            } catch (Exception e) {
                throw new BusinessException("获取属性错误",e);
            }
        }
        return map;
    }

    /**
     * list是否为空
     * @param list
     * @return
     */
    public static Boolean isEmpty(List list){
        if(list==null||list.size()==0){
            return Boolean.TRUE;
        }
        return Boolean.FALSE;
    }

    /**
     * 以list元素中得某一属性为key转换为一个map，如果元素中key有重复，会加到map key对应的list中
     * @param sourceList
     * @param key
     * @param <K>
     * @param <T>
     * @return
     */
    public static <K,T> Map<K,List<T>> convertToMaps(List<T> sourceList, String key) {
        Map<K,List<T>> map = new HashMap<>();
        if(isEmpty(sourceList)){
            return new HashMap<>();
        }
        Class elemeClazz = sourceList.get(0).getClass();
        Field field = null;
        try {
            field = elemeClazz.getDeclaredField(key);
            field.setAccessible(true);
        } catch (Exception e) {
            throw new BusinessException("属性不存在",e);
        }
        for(T t:sourceList ){
            try {
                K value = (K) field.get(t);
                List<T> ts = map.get(value);
                if(ts==null){
                    ts = new ArrayList<>();
                    map.put(value,ts);
                }
                ts.add(t);
            } catch (Exception e) {
                throw new BusinessException("获取属性错误",e);
            }
        }
        return map;
    }

    public static <T> List<List<T>> splitList(List<T> list, int pageSize) {
        List<List<T>> retList = new ArrayList<List<T>>();
        int index = 0;
        while(list.size() >= ( index*pageSize)){
            if((( index+1)*pageSize) > list.size()){
                retList.add(list.subList( index*pageSize, list.size()));
                break;
            }
            retList.add(list.subList( index*pageSize, (index+1)*pageSize));
            index++;
        }
        return retList;
    }

    public static <T> boolean containSameElements(List<T> list1, List<T> list2) {
        if (isEmpty(list1) && isEmpty(list2)) {
            return true;
        }
        if (isEmpty(list1) && !isEmpty(list2) || !isEmpty(list1) && isEmpty(list2)) {
            return false;
        }
        return new HashSet<>(list1).equals(new HashSet<>(list2));
    }
}
