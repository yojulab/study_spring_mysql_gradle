package com.example.co_templates.restapis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.co_templates.services.BoardService;

@RestController
public class BoardRestController {

    @Autowired 
    BoardService BoardService;

    // /r/board/List/{page}?searchword={word}
    // /r/board/List/2?searchword=coco lang
    @GetMapping({"/r/board/List/{pageNumber}", "/r/board/List"})
    public ResponseEntity<Object> callBoardList(@PathVariable(required = false) String pageNumber
            ,@RequestBody HashMap<String,Object> dataMap) {
        Object list = BoardService.list(dataMap);
        return ResponseEntity.ok().body(list);
    }

    @GetMapping("/r/board/Insert")
    public void callBoardInsert(HashMap dataMap) {
        BoardService.insert(dataMap);
        return;
    }

    @GetMapping("/r/board/Update")
    public void callBoardUpdate(HashMap dataMap) {
        BoardService.update(dataMap);
        return;
    }

    @GetMapping("/r/board/Delete")
    public void callBoardDelete(HashMap dataMap) {
        BoardService.delete(dataMap);
        return;
    }
}