git submodule update --init --recursive

# Runtime dependencies
python -m pip install --upgrade pip
python -m pip install setuptools expandvars
python -m pip install -i https://pypi.anaconda.org/scientific-python-nightly-wheels/simple cython
python -m pip install --no-build-isolation git+https://github.com/aio-libs/multidict
python -m pip install --no-build-isolation git+https://github.com/lysnikolaou/frozenlist@free-threading
python -m pip install --no-build-isolation git+https://github.com/lysnikolaou/propcache@freethreading-support
python -m pip install --no-build-isolation git+https://github.com/lysnikolaou/yarl@free-threading-support
python -m pip install aiohappyeyeballs aiosignal blockbuster

# Build llhttp
pushd vendor/llhttp/
npm ci
make
popd

# Generate Cython extension modules
make cythonize

python -m pip install -e.

# Test dependencies
python -m pip install pytest-cov pytest-mock pytest-codspeed freezegun proxy-py gunicorn
python -m pip install git+https://github.com/lysnikolaou/brotli@free-threaded-slot
