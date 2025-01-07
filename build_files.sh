# #!/bin/bash
# python3 -m pip install -r requirements.txt
# python3 manage.py collectstatic --noinput

#!/bin/bash

mkdir -p staticfiles
python manage.py collectstatic --noinput


# Install dependencies
echo "Installing dependencies from requirements.txt..."
pip install -r requirements.txt

# Collect static files (if using Django or similar framework)
if [ -f manage.py ]; then
    echo "Collecting static files..."
    python manage.py collectstatic --noinput
fi

# Run database migrations (if applicable)
if [ -f manage.py ]; then
    echo "Applying database migrations..."
    python manage.py migrate --noinput
fi

# Additional build steps can be added here
echo "Build process completed successfully!"
