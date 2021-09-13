# frozen_string_literal: true

module Mrm
  module Repositories
    ALIYUN = <<~ALIYUN
      <mirror>
        <id>aliyunmaven</id>
        <mirrorOf>*</mirrorOf>
        <name>阿里云公共仓库</name>
        <url>https://maven.aliyun.com/repository/public</url>
      </mirror>
    ALIYUN

    NETEASE = <<~NETEASE
      <mirror>
        <id>nexus-163</id>
        <mirrorOf>*</mirrorOf>
        <name>Nexus 163</name>
        <url>http://mirrors.163.com/maven/repository/maven-public/</url>
      </mirror>
    NETEASE

    TENCENT = <<~TENCENT
      <mirror>
        <id>nexus-tencentyun</id>
        <mirrorOf>*</mirrorOf>
        <name>Nexus tencentyun</name>
        <url>http://mirrors.cloud.tencent.com/nexus/repository/maven-public/</url>
      </mirror>
    TENCENT

    HUAWEI = <<~HUAWEI
      <mirror>
        <id>huaweicloud</id>
        <mirrorOf>*</mirrorOf>
        <url>https://repo.huaweicloud.com/repository/maven/</url>
      </mirror>
    HUAWEI
  end
end
