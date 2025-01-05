
# DevOps Project

### ENG 


This project includes PostgreSQL, Redis, Prometheus, and Grafana services, orchestrated with Docker Compose. The goal is to ensure these services work properly and set up a basic monitoring system. Everything is configured to run automatically in Docker containers.

## Table of Contents

1. [Installation](#installation)
2. [Project Structure](#project-structure)
3. [Services](#services)
4. [Grafana Dashboards](#grafana-dashboards)
5. [Shell Script Usage](#shell-script-usage)
6. [Links](#links)

---

## Installation

To run this project on your computer, follow the steps below:

### Requirements

- **Docker**: [Download and install Docker here](https://www.docker.com/get-started).
- **Docker Compose**: [Download and install Docker Compose here](https://docs.docker.com/compose/install/).

Alternatively, you can automate the installation of Docker and Docker Compose by running the `scripts/install.sh` file. Follow these steps:

1. **Run the `install.sh` Script**:

   Go to the project directory and run the `install.sh` script to install Docker and Docker Compose:

   ```bash
   cd devops-project
   chmod +x scripts/install.sh
   ./scripts/install.sh
   ```

2. **Verify the Installation of Docker and Docker Compose:**:

   After the installation is complete, run the following commands to verify that Docker and Docker Compose are installed correctly:

   ```bash
   docker --version
   docker-compose --version
   ```

### Steps

1. **Clone the Project:**:

    ```bash
    git clone https://github.com/yourusername/devops-project.git
    cd devops-project
    ```

2. **Configure Environment Variables**:

    Create a `.env` file and modify its contents according to your requirements:

    ```bash
    POSTGRES_USER=admin
    POSTGRES_PASSWORD=password
    POSTGRES_DB=app_db
    REDIS_PASSWORD=redissecure
    GRAFANA_USER=admin
    GRAFANA_PASSWORD=admin
    ```

3. **Start the Services with Docker Compose:**:

    To start the project, run the following command:

    ```bash
    docker compose up -d
    ```

    This command will start the Docker containers and launch all required services.

4. **Accessing Grafana**:

    You can access the Grafana interface at [http://localhost:3000](http://localhost:3000). The default username is `admin` and the password is `admin`.

---

## Project Structure

The project directory is structured as follows:

```
devops-project/
│
├── data
├── db      
    └── init.sql
├── monitoring    
    └── prometheus.yml
├── grafana/
│   ├── dashboards/              # Dashboard JSON files
│   ├── provisioning/            # Grafana provisioning configuration files
│   └── upload_dashboards.sh      # Shell script used to upload dashboards
├── monitoring/
│   └── prometheus.yml           # Prometheus configuration file
└── scripts/
    └── install.sh 
    └── test_postgres.sh         # Shell script used for PostgreSQL testing 
    └── test_redis.sh            # Shell script used for Redis testing
├── docker-compose.yml           # Docker Compose configuration file
├── .env                         # Environment variables file
```
---

## Services

The following services are used in this project:

- **PostgreSQL**: A database management system. The default username is `admin` and the password is `admin`.
- **Redis**: An in-memory data structure store, used for data caching. The default password is `redissecure`.
- **Prometheus**: A monitoring and metric collection tool. Prometheus collects and stores the data.
- **Grafana**: A tool that visualizes metrics from Prometheus. The default username is `admin` and the password is `admin`.

---

## Grafana Dashboards

Dashboards will be created for PostgreSQL and Redis. These dashboards are integrated with the **Prometheus** data source and visualize the monitoring data of both services.

In the Grafana interface, the dashboards will be located as follows:

- **PostgreSQL Dashboard**: Displays the metrics of the PostgreSQL database.
- **Redis Dashboard**: Displays the metrics of the Redis service.

### Dashboard Upload Methods

#### Method 1: Uploading Dashboards Using the Grafana UI

You can manually upload dashboards in Grafana as well. Follow the steps below to import a dashboard JSON file:

1. Click on the **Dashboards** menu.
2. Click the **New** button and select the **Import** option from the menu.
3. Perform one of the following actions:
    - **Upload the Dashboard JSON file**.
    - **Paste the Grafana.com dashboard URL or ID into the appropriate field**.
    - **Paste the Dashboard JSON text directly into the text area**.
4. (Optional) Change the dashboard's name, folder, or UID, and specify the metric prefix if the dashboard uses one.
5. If necessary, select a **data source**. (The Prometheus data source will be loaded when the project is running.)
6. Click the **Import** button.

With these steps, you can manually upload the JSON file and use the dashboard in Grafana.

#### Method 2: Uploading Dashboards with the `upload_dashboard.sh` Script

If provisioning is not used, we have written a **bash script** to upload dashboards. This script uses JSON files to upload dashboards to Grafana.

**Follow the steps below to run the script:**

1. **Ensure Grafana is running** (Grafana typically runs at `http://localhost:3000`).
2. **Run the following command to upload the dashboards**:

    ```bash
    chmod +x grafana/upload_dashboard.sh
    ./grafana/upload_dashboard.sh
    ```

This command will use the JSON files located in the `grafana/dashboards` folder to upload the PostgreSQL and Redis dashboards to Grafana.

---

## Using Shell Scripts

In the project, there are some shell scripts used to test the PostgreSQL and Redis services via the CLI. You can run these scripts to test your connection to both services.

- **PostgreSQL Test**:

    To test the connection to PostgreSQL, you can use the following command:

    ```bash
    ./scripts/test_postgres.sh
    ```

    Alternatively, you can directly connect to the database from the terminal using the following command:

    ```bash
    docker exec -it postgres psql -U admin -d app_db
    ```

- **Redis Test**:

    To test the connection to Redis, you can use the following command:

    ```bash
    ./scripts/test_redis.sh
    ```

    Alternatively, you can directly connect to Redis from the terminal using the following command:

    ```bash
    docker exec -it redis redis-cli  
    ```

---

## Links

- **Grafana**: [http://localhost:3000](http://localhost:3000)
- **Prometheus**: [http://localhost:9090](http://localhost:9090)

---

**Note**: Please replace the file paths with the paths on your own computer.

---

**Note**: If you encounter any issues, please feel free to contact us.

---

### TR
Bu proje, PostgreSQL, Redis, Prometheus ve Grafana servislerini içeriyor ve Docker Compose ile orkestre edilmektedir. Amacımız, bu servislerin düzgün çalışmasını sağlamak ve temel bir izleme sistemi kurmaktır. Ayrıca, her şey otomatik olarak Docker konteynerlerinde çalışacak şekilde yapılandırılmıştır.

## İçindekiler

1. [Kurulum](#kurulum)
2. [Proje Yapısı](#proje-yapısı)
3. [Servisler](#servisler)
4. [Grafana Dashboardları](#grafana-dashboardları)
5. [Shell Script Kullanımı](#shell-script-kullanımı)
6. [Bağlantılar](#bağlantılar)

---

## Kurulum

Bu projeyi kendi bilgisayarınızda çalıştırabilmek için aşağıdaki adımları takip edin:

### Gereksinimler

- **Docker**: [Docker'ı buradan indirip kurun](https://www.docker.com/get-started).
- **Docker Compose**: [Docker Compose'u buradan indirip kurun](https://docs.docker.com/compose/install/).

Alternatif olarak, projenin içinde bulunan `scripts/install.sh` dosyasını çalıştırarak Docker ve Docker Compose'un kurulumunu otomatik olarak gerçekleştirebilirsiniz. Bunun için aşağıdaki adımları izleyin:

1. **`install.sh` Dosyasını Çalıştırın**:
   
   Proje dizinine gidin ve `install.sh` dosyasını çalıştırarak Docker ve Docker Compose'u kurun:

   ```bash
   cd devops-project
   chmod +x scripts/install.sh
   ./scripts/install.sh
   ```

2. **Docker ve Docker Compose'un Kurulduğunu Doğrulayın**:

   Kurulum tamamlandıktan sonra, aşağıdaki komutları çalıştırarak Docker ve Docker Compose'un doğru bir şekilde kurulduğunu doğrulayın:

   ```bash
   docker --version
   docker-compose --version
   ```


### Adımlar

1. **Projeyi Klonlayın**:

    ```bash
    git clone https://github.com/yourusername/devops-project.git
    cd devops-project
    ```

2. **Ortam Değişkenlerini Yapılandırın**:

    `.env` dosyasını aşağıdaki gibi oluşturun ve içeriğini kendi gereksinimlerinize göre düzenleyin:

    ```bash
    POSTGRES_USER=admin
    POSTGRES_PASSWORD=password
    POSTGRES_DB=app_db
    REDIS_PASSWORD=redissecure
    GRAFANA_USER=admin
    GRAFANA_PASSWORD=admin
    ```

3. **Docker Compose ile Servisleri Başlatın**:

    Projeyi başlatmak için aşağıdaki komutu çalıştırın:

    ```bash
    docker compose up -d
    ```

    Bu komut, Docker konteynerlerini başlatacak ve gerekli tüm servisleri ayağa kaldıracaktır.

4. **Grafana'ya Erişim**:

    Grafana arayüzüne [http://localhost:3000](http://localhost:3000) adresinden erişebilirsiniz. Varsayılan kullanıcı adı `admin`, şifre ise `admin`'dir.

---

## Proje Yapısı

Proje dizini şu şekilde yapılandırılmıştır:

```
devops-project/
│
├── data
├── db      
    └── init.sql
├── monitoring    
    └── prometheus.yml
├── grafana/
│   ├── dashboards/              # Dashboard JSON dosyaları
│   ├── provisioning/            # Grafana provisioning yapılandırma dosyaları
│   └── upload_dashboards.sh      # Dashboard'ları yüklemek için kullanılan shell script
├── monitoring/
│   └── prometheus.yml           # Prometheus yapılandırma dosyası
└── scripts/
    └── install.sh 
    └── test_postgres.sh         # PostgreSQL testi için kullanılan shell script
    └── test_redis.sh            # Redis testi için kullanılan shell script
├── docker-compose.yml           # Docker Compose yapılandırma dosyası
├── .env                         # Ortam değişkenleri dosyası
```
---

## Servisler

Bu projede aşağıdaki servisler kullanılmaktadır:

- **PostgreSQL**: Veritabanı yönetim sistemi. Varsayılan kullanıcı adı `admin`, şifre ise `admin`'dir.
- **Redis**: Bellek içi veri yapıları sunan, veri önbellekleme servisidir. Varsayılan şifre `redissecure`'dir.
- **Prometheus**: İzleme ve metrik toplama aracıdır. Prometheus, verileri toplar ve saklar.
- **Grafana**: Prometheus'tan gelen metrikleri görselleştiren bir araçtır. Varsayılan kullanıcı adı `admin`, şifre ise `admin`'dir

---

## Grafana Dashboardları

PostgreSQL ve Redis için dashboard’lar oluşturulacaktır. Bu dashboard'lar **Prometheus** datasource'u ile entegre olup, her iki servisin izleme verilerini görselleştirir.

Grafana arayüzünde dashboard'lar aşağıdaki konumda bulunacaktır:

- **PostgreSQL Dashboard**: PostgreSQL veritabanının metriklerini gösterir.
- **Redis Dashboard**: Redis servisinin metriklerini gösterir.

### Dashboard Yükleme Yöntemleri

#### Yöntem 1: Grafana UI Kullanarak Dashboard Yüklemek

Grafana üzerinde dashboard'ları manuel olarak da yükleyebilirsiniz. Aşağıdaki adımları izleyerek bir dashboard JSON dosyasını import edebilirsiniz:

1. **Dashboards** menüsüne tıklayın.
2. **New** butonuna tıklayın ve açılan menüden **Import** seçeneğini seçin.
3. Şu adımlardan birini gerçekleştirin:
    - **Dashboard JSON dosyasını yükleyin**.
    - **Grafana.com dashboard URL veya ID'sini ilgili alana yapıştırın**.
    - **Dashboard JSON metnini doğrudan metin alanına yapıştırın**.
4. (Opsiyonel) Dashboard ismini, klasörünü veya UID'sini değiştirin ve dashboard herhangi bir metrik ön eki kullanıyorsa, bunu da belirtin.
5. Gerekirse bir **data source** seçin. (Proje çalıştırıldığında prometheus data source olarak yüklenmiş olacaktır.)
6. **Import** butonuna tıklayın.

Bu adımlarla JSON dosyasını manuel olarak yükleyebilir ve Grafana üzerinde dashboard'u kullanabilirsiniz.

#### Yöntem 2: `upload_dashboard.sh` Script'i ile Dashboard Yüklemek

Eğer provisioning ile yükleme yapılmazsa, dashboard'ları yüklemek için bir **bash script** yazdık. Bu script, JSON dosyalarını kullanarak dashboard'ları Grafana'ya yükler.

**Script'i çalıştırmak için aşağıdaki adımları takip edin:**

1. **Grafana'nın çalıştığından emin olun** (Grafana genellikle `http://localhost:3000` adresinde çalışır).
2. **Dashboard'ları yüklemek için aşağıdaki komutu çalıştırın**:

    ```bash
    chmod +x grafana/upload_dashboard.sh
    ./grafana/upload_dashboard.sh
    ```

Bu komut, `grafana/dashboards` klasöründe yer alan JSON dosyalarını kullanarak PostgreSQL ve Redis dashboard'larını Grafana'ya yükleyecektir.


---

## Shell Script Kullanımı

Projede, PostgreSQL ve Redis servislerini CLI üzerinden test etmek için kullanılan bazı shell script'leri bulunmaktadır. Bu script'leri çalıştırarak her iki servis ile bağlantınızı test edebilirsiniz.

- **PostgreSQL Testi**:

    PostgreSQL ile bağlantıyı test etmek için aşağıdaki komutu kullanabilirsiniz:

    ```bash
    ./scripts/test_postgres.sh
    ```

    Veya terminalden aşağıdaki komut ile database'e direkt bağlanabilirsiniz:

    ```bash
    docker exec -it postgres psql -U admin -d app_db
    ```

- **Redis Testi**:

    Redis ile bağlantıyı test etmek için aşağıdaki komutu kullanabilirsiniz:

    ```bash
    ./scripts/test_redis.sh
    ```

    Veya terminalden aşağıdaki komut ile redis'e direkt bağlanabilirsiniz:

    ```bash
    docker exec -it redis redis-cli  
    ```

---

## Bağlantılar

- **Grafana**: [http://localhost:3000](http://localhost:3000)
- **Prometheus**: [http://localhost:9090](http://localhost:9090)

---

**Not**: Lütfen dosya yollarını kendi bilgisayarınızdaki yollar ile değiştiriniz.

---

**Not**: Eğer herhangi bir sorun ile karşılaşırsanız, lütfen iletişime geçiniz.
