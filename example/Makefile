init:
	make -C .. build.ios
	cd ios && pod	install --repo-update

clean:
	make -C .. clean.ios

fclean: clean; rm -rf ios/Pods
