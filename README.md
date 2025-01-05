
# DevOps Project

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

#### Yöntem 1: GGrafana UI Kullanarak Dashboard Yüklemek

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

- **Redis Testi**:

    Redis ile bağlantıyı test etmek için aşağıdaki komutu kullanabilirsiniz:

    ```bash
    ./scripts/test_redis.sh
    ```

---

## Bağlantılar

- **Grafana**: [http://localhost:3000](http://localhost:3000)
- **Prometheus**: [http://localhost:9090](http://localhost:9090)

---

**Not**: Eğer herhangi bir sorun ile karşılaşırsanız, lütfen projenin GitHub sayfasında issue açın veya daha fazla destek için buraya geri dönün.
