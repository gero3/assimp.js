if  [ ! -d assimp ]; then
	git clone https://github.com/assimp/assimp.git assimp
fi
cd assimp
git clean -dxf
export CFLAGS="-DASSIMP_BUILD_NO_3MF_IMPORTER=1 --memory-init-file 0 -s INVOKE_RUN=0 -s NO_EXIT_RUNTIME=1 -s DISABLE_EXCEPTION_CATCHING=0 -s ASSERTIONS=1 -s TOTAL_MEMORY=80088008"
export CXXFLAGS="-DASSIMP_BUILD_NO_3MF_IMPORTER=1 --memory-init-file 0 -s INVOKE_RUN=0 -s NO_EXIT_RUNTIME=1 -s DISABLE_EXCEPTION_CATCHING=0 -s ASSERTIONS=1 -s TOTAL_MEMORY=80088008"

emconfigure cmake -DASSIMP_NO_EXPORT=ON -DASSIMP_BUILD_TESTS=OFF -DCMAKE_BUILD_TYPE=Release
#emconfigure cmake -DASSIMP_NO_EXPORT=ON -DASSIMP_BUILD_TESTS=OFF
emmake make
cp bin/assimp.js ../assimp.js