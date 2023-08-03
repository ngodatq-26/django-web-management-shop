from django.db import models


class Category(models.Model):
    name = models.CharField(max_length=100)
    parent_category = models.ForeignKey('self', on_delete=models.SET_NULL,
                                        null=True,
                                        blank=True)

    class Meta:
        db_table = 'shop_category'

    def __str__(self):
        return self.name
