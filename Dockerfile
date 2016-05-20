FROM sealink/phpdocker:7.0.6

# Set craft version
ENV CRAFTURL 'https://download.buildwithcraft.com/craft/2.6/2.6.2788/Craft-2.6.2788.zip'

WORKDIR /app/

# Download the latest Craft, save as craft.zip in current folder
RUN wget $CRAFTURL -O "/app/craft.zip"

# Extract just the craft directory and index out of the archive, quietly
RUN unzip -qquo /app/craft.zip 'craft/*' 'public/index.php'

# cleanup
RUN rm /app/craft.zip

# create craft version
RUN echo $(egrep '(CRAFT_VERSION|CRAFT_BUILD)' /app/craft/app/Info.php | awk '{print $2}' | sed s@[^0-9\.]@@g) | tee public/craftversion.txt

# remove default template files
RUN rm -rf /app/craft/templates/*

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
COPY Rakefile /app/

# add default config
ENV ENV_REPLACE_FOLDER '/app/craft/config'
ADD ./config /app/craft/config

RUN chown -Rf nginx:nginx /app

EXPOSE 80
