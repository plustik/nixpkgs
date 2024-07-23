{
  lib,
  buildPythonPackage,
  fetchPypi,
  jedi,
  pygments,
  urwid,
  urwid-readline,
  pytest-mock,
  pytestCheckHook,
  pythonOlder,
}:

buildPythonPackage rec {
  pname = "pudb";
  version = "2024.1.2";
  format = "setuptools";

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-rcmwAEK6g2cRffCmwNxi+pYJq9IcO/jltz1iCQfFtD4=";
  };

  propagatedBuildInputs = [
    jedi
    pygments
    urwid
    urwid-readline
  ];

  nativeCheckInputs = [
    pytest-mock
    pytestCheckHook
  ];

  preCheck = ''
    export HOME=$TMPDIR
  '';

  pythonImportsCheck = [ "pudb" ];

  meta = with lib; {
    description = "Full-screen, console-based Python debugger";
    mainProgram = "pudb";
    homepage = "https://github.com/inducer/pudb";
    changelog = "https://github.com/inducer/pudb/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
