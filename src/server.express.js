(function(express, spawn){
    "use strict";
    return express().
	.get("/", function(request, response){
	    return spawn("/usr/bin/systemctl", ["status", "jenkins.service"])
		.then(function(success){
		    return response.send("SUCCESS:\t"+JSON.stringify(success));
		}, function(rageguy){
		    return response.send("FAILURE:\t"+JSON.stringify(rageguy));
		});
	})
	.listen(22815)
}(require("express"), require("child-process.promise").spawn));
