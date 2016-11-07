#sources
source 'https://github.com/CocoaPods/Specs.git'
source 'https://vcs1.tempos21.com/scm/git/t21_pods_ios'

workspace 'T21MaterialTextField'
project 'T21MaterialTextField'

target 'T21MaterialTextField' do
    #Dependencies for the primary target (the main app or the main library)
    use_frameworks!

    pod 'Material' , '~>2'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '8.0'
        end
    end
end
