FROM sealink/phpdocker:latest

# Set craft version
ENV CRAFTURL 'https://download.buildwithcraft.com/craft/2.5/2.5.2767/Craft-2.5.2767.zip'

WORKDIR /usr/cms/

# Download the latest Craft, save as craft.zip in current folder
RUN wget $CRAFTURL -O "/usr/cms/craft.zip"

# Extract just the craft directory and index out of the archive, quietly
RUN unzip -qquo /usr/cms/craft.zip 'craft/*' 'public/index.php'

# cleanup
RUN rm /usr/cms/craft.zip

# create craft version
RUN echo $(egrep '(CRAFT_VERSION|CRAFT_BUILD)' /usr/cms/craft/app/Info.php | awk '{print $2}' | sed s@[^0-9\.]@@g) | tee public/craftversion.txt

# remove default template files
RUN rm -rf /usr/cms/craft/templates/*

# Add pansophy support for deploying configuration files
RUN \
  apt-get update && \
  apt-get -y install libreadline-dev && \
  apt-get clean
RUN git clone https://github.com/rbenv/ruby-build.git /ruby-build
RUN /ruby-build/install.sh
RUN ruby-build 2.3.0 /ruby-2.3.0
ENV PATH /ruby-2.3.0/bin:$PATH
RUN gem install pansophy mime-types --no-ri --no-rdoc
COPY Rakefile /usr/cms

# add default config
ADD ./config /usr/cms/craft/config

RUN chown -Rf nginx:nginx /usr/cms

EXPOSE 80
