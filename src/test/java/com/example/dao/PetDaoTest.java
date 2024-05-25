package com.example.dao;

import org.junit.jupiter.api.Test;
import com.example.domain.Pet;
import org.junit.jupiter.api.BeforeEach;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;

class PetDaoTest {
    private PetDao petDao;
    @BeforeEach
    public void init(){
        petDao = new PetDao();
    }
    @Test
    void getNewList() {
        List<Pet> list = petDao.getNewList();
        assertEquals(12,list.size());
        for(Pet pet:list){
            System.out.println(pet.getTitle());
        }
    }

}