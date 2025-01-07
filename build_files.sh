# #!/bin/bash
# python3 -m pip install -r requirements.txt
# python3 manage.py collectstatic --noinput

#!/bin/bash

mkdir -p staticfiles
python manage.py collectstatic --noinput


#!/bin/bash

# Update pip to the latest version
echo "Upgrading pip..."
python -m pip install --upgrade pip

# Install dependencies
echo "Installing dependencies..."
pip install -r requirements.txt

# Remove platform-specific dependencies
echo "Removing incompatible dependencies..."
sed -i '/pywin32/d' requirements.txt

# Collect static files (if using Django)
if [ -f manage.py ]; then
    echo "Collecting static files..."
    mkdir -p staticfiles
    python manage.py collectstatic --noinput
fi

# Apply database migrations
if [ -f manage.py ]; then
    echo "Applying database migrations..."
    python manage.py migrate --noinput
fi

echo "Build process completed successfully!"
