/*
  Warnings:

  - You are about to drop the column `BarbershopId` on the `BarbershopService` table. All the data in the column will be lost.
  - You are about to drop the column `BarbershopId` on the `Booking` table. All the data in the column will be lost.
  - You are about to drop the column `DateTime` on the `Booking` table. All the data in the column will be lost.
  - Added the required column `barbershopId` to the `BarbershopService` table without a default value. This is not possible if the table is not empty.
  - Added the required column `date` to the `Booking` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "BarbershopService" DROP CONSTRAINT "BarbershopService_BarbershopId_fkey";

-- AlterTable
ALTER TABLE "BarbershopService" DROP COLUMN "BarbershopId",
ADD COLUMN     "barbershopId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Booking" DROP COLUMN "BarbershopId",
DROP COLUMN "DateTime",
ADD COLUMN     "date" TIMESTAMP(3) NOT NULL;

-- AddForeignKey
ALTER TABLE "BarbershopService" ADD CONSTRAINT "BarbershopService_barbershopId_fkey" FOREIGN KEY ("barbershopId") REFERENCES "Barbershop"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
