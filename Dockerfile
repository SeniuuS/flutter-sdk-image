FROM mobiledevops/android-sdk-image:29.0.3

ENV FLUTTER_VERSION="2.10.5"
ENV FLUTTER_HOME "/home/mobiledevops/.flutter-sdk"
ENV PATH $PATH:$FLUTTER_HOME/bin

# Download and extract Flutter SDK
RUN mkdir $FLUTTER_HOME \
    && cd $FLUTTER_HOME \
    && curl --fail --remote-time --silent --location -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz \
    && tar xf flutter_linux_${FLUTTER_VERSION}-stable.tar.xz --strip-components=1 \
    && rm flutter_linux_${FLUTTER_VERSION}-stable.tar.xz

RUN mkdir $ANDROID_HOME/cmdline-tools/latest
RUN mv $ANDROID_HOME/cmdline-tools/bin $ANDROID_HOME/cmdline-tools/latest/
RUN mv $ANDROID_HOME/cmdline-tools/source.properties $ANDROID_HOME/cmdline-tools/latest/
RUN mv $ANDROID_HOME/cmdline-tools/lib $ANDROID_HOME/cmdline-tools/latest/
RUN mv $ANDROID_HOME/cmdline-tools/NOTICE.txt $ANDROID_HOME/cmdline-tools/latest/

ENV PATH $PATH:$ANDROID_HOME/cmdline-tools/latest/bin

RUN flutter precache
