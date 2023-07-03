package org.zerock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.SampleVO;
import org.zerock.domain.Ticket;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/sample/*")
@Log4j
public class SampleController {
	
	@GetMapping(value="/getText", produces="text/plain; charset=UTF-8")
	public String getText() {
		
		log.info("MIME TYPE: " + MediaType.TEXT_PLAIN_VALUE);
		
		return "Hello, Human.";
	}
	
	@GetMapping("/getText2")	//default: text/html;charset=ISO-8859-1
	public String getText2() {
		return "Hello, INTERNET";
	}
	
	@GetMapping(value="/getSample",
			produces= { MediaType.APPLICATION_JSON_UTF8_VALUE,	//JSON은 그냥 디폴트랑 똑같다.
						MediaType.APPLICATION_XML_VALUE})
	public SampleVO getSample() {
		return new SampleVO(112, "스타", "로드");
	}
	
	@GetMapping("/getSample2")	//default: application/xhtml + xml;charset=UTF-8
	public SampleVO getSample2() {
		return new SampleVO(113, "악의", "라쿤맨");
	}
	
	@GetMapping("/getList")
	public List<SampleVO> getList(){
		return IntStream.range(1, 10).mapToObj(i -> new SampleVO(i, i+"First", i + " Last"))
				.collect(Collectors.toList());
	}
	
	@GetMapping(value="/getMap")
	public Map<String, SampleVO> getMap(){
		
		Map<String, SampleVO>map = new HashMap<>();
		map.put("First", new SampleVO(111, "그루트", "주니어"));
		
		return map; 
	}
	
	@GetMapping(value = "/check" /* , params = {"height", "weight"} */)
	public ResponseEntity<SampleVO> check(Double height, Double weight) {
		
		SampleVO vo = new SampleVO(0, "" + height, "" + weight);
		
		ResponseEntity<SampleVO> result = null;
		
		if(height < 150) {
			result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo);
		} else {
			result = ResponseEntity.status(HttpStatus.OK).body(vo);
		}
		
		return result;
	}
	
	@GetMapping("/product/{cat}/{pid}")
	public String[] getPath(
		@PathVariable("cat") String cat,
		@PathVariable("pid") Integer pid) {
		return new String[] { "category: " + cat, "productid: " + pid};
	}

	@GetMapping("/product2/{cat}/{pid}")
	public List getPath2(
		@PathVariable("cat") String cat,
		@PathVariable("pid") Integer pid) {
		List list = new ArrayList<>();
		list.add("category: " + cat);
		list.add("productid: " + pid);
		return list;
	}
	
	@GetMapping("/product3/{cat}/{pid}")
	public Map getPath3(
		@PathVariable("cat") String cat,
		@PathVariable("pid") Integer pid) {
		Map map = new HashMap<>();
		map.put("productid", pid);
		map.put("category", cat);
		return map;
	}
	
	//나중에 다시 살펴볼 Post 메서드
	@PostMapping("/ticket")
	public Ticket convert(@RequestBody Ticket ticket) {
		log.info("convert..................ticket" + ticket);
		
		return ticket;
	}
}
