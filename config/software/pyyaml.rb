name "pyyaml"
default_version "3.11"

dependency "python"
dependency "pip"

if ohai['platform'] == 'windows'
  dependency "libyaml-windows"
else
  dependency "libyaml"
end

build do
  ship_license "http://dd-agent-omnibus.s3.amazonaws.com/pyyaml-LICENSE"
  pip "install --install-option=\"--install-scripts="\
      "#{windows_safe_path(install_dir)}/bin\" "\
      "#{name}==#{version}"
end
